import 'package:adoptify/Pages/aboutMessages/signallingService.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/callsHistoryDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:iconly/iconly.dart';

class VoiceCallPage extends StatefulWidget {
  final CallsHistoryData callHistory;
  final bool isCaller; // Define if the user is initiating the call

  const VoiceCallPage({super.key, required this.callHistory, this.isCaller = false});

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  final SignallingService signallingService = SignallingService.instance;

  MediaStream? _localStream;
  RTCPeerConnection? _peerConnection;
  bool isAudioOn = true;
  bool isSpeakerOn = false;

  @override
  void initState() {
    super.initState();
    _initiateVoiceCall();
  }

  Future<void> _initiateVoiceCall() async {
    try {
      // 1. Setup PeerConnection
      _peerConnection = await createPeerConnection({
        'iceServers': [
          {'urls': 'stun:stun.l.google.com:19302'},
          // Add TURN server here for production
        ]
      });

      // 2. Get Local Media Stream (Audio)
      _localStream = await navigator.mediaDevices.getUserMedia(
        {'audio': true, 'video': false}
      );
      _localStream?.getTracks().forEach((track) {
        _peerConnection?.addTrack(track, _localStream!);
      });

      // 3. Handle Local/Remote SDP and ICE Candidates
      _setupConnectionListeners();

      if (widget.isCaller) {
        await _createOffer(); // Caller creates an offer
      }
    } catch (e) {
      debugPrint("Error during voice call setup: $e");
    }
  }

  void _setupConnectionListeners() {
    // 1. Listen for ICE candidates
    _peerConnection?.onIceCandidate = (candidate) {
      if (candidate != null) {
        signallingService.socket?.emit("sendIceCandidate", {
          "iceCandidate": candidate.toMap(),
        });
      }
    };

    // 2. Listen for remote streams
    _peerConnection?.onTrack = (event) {
      if (event.streams.isNotEmpty) {
        debugPrint("Remote stream received.");
      }
    };

    // 3. Listen for connection state changes
    _peerConnection?.onConnectionState = (state) {
      debugPrint("Connection state: $state");
      if (state == RTCPeerConnectionState.RTCPeerConnectionStateDisconnected ||
          state == RTCPeerConnectionState.RTCPeerConnectionStateFailed) {
        _endCall();
      }
    };

    // Handle offer from the callee
    signallingService.socket?.on("offerReceived", (data) async {
      await _peerConnection?.setRemoteDescription(
      RTCSessionDescription(data["sdpOffer"]["sdp"], data["sdpOffer"]["type"]));
      RTCSessionDescription answer = await _peerConnection!.createAnswer();
      await _peerConnection?.setLocalDescription(answer);
      signallingService.socket?.emit("sendAnswer", {"sdpAnswer": answer.toMap()});
    });

    // Handle ICE candidates
    signallingService.socket?.on("iceCandidateReceived", (data) {
      _peerConnection?.addCandidate(RTCIceCandidate(
        data["candidate"],
        data["sdpMid"],
        data["sdpMLineIndex"],
      ));
    });
  }

  Future<void> _createOffer() async {
    RTCSessionDescription offer = await _peerConnection!.createOffer();
    await _peerConnection!.setLocalDescription(offer);

    signallingService.socket?.emit("sendOffer", {"sdpOffer": offer.toMap()});
  }

  void _toggleMic() {
    setState(() {
      isAudioOn = !isAudioOn;
    });
    _localStream?.getAudioTracks().forEach((track) {
      track.enabled = isAudioOn;
    });
  }

  //setAudioOutput
  Future<void> _toggleSpeaker() async {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
    });
    if(_localStream != null){
      await Helper.selectAudioOutput(isSpeakerOn? 'speaker': 'earpiece');
    }
  }


  void _endCall() {
    // Close the peer connection and dispose of the stream
    _peerConnection?.close();
    _localStream?.dispose();

    // Safely navigate back to the previous page
    if (mounted) { // Check if the widget is still mounted
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(mounted){
          Navigator.pop(context);
        }
      });
    }
  }


  @override
  void dispose() {
    _peerConnection?.close();
    _localStream?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/image/call_background.jpg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(IconlyLight.arrow_left, color: Colors.white, size: 25),
                    onPressed: _endCall,
                  ),
                ],
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(widget.callHistory.petOrganizationPicUrl),
                  onBackgroundImageError: (_,__) => const AssetImage('assets/logo/no_image.png'),
                ),

                const SizedBox(height: 18),

                Text(widget.callHistory.petOrganizationName,textAlign: TextAlign.center,
                    style: heading3Bold.copyWith(color: Colors.white)),

                const SizedBox(height: 18),
                //call duration , //need to implement package, this s 4 eg
                Text('06:25 minutes', style: bodyXLMedium.copyWith(color: Colors.white)),

                const SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buttonWidget(isSpeakerOn? IconlyBold.volume_up: Icons.volume_off_rounded, Colors.white.withOpacity(0.3), _toggleSpeaker),
                    _buttonWidget(isAudioOn? IconlyBold.voice: Icons.mic_off, Colors.white.withOpacity(0.3), _toggleMic),
                    _buttonWidget(IconlyBold.call_missed, Colors.red, _endCall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonWidget(IconData icon, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 25),
          onPressed: onPressed,
        ),
      ),
    );
  }

  
}
