import 'package:adoptify/Pages/aboutMessages/signalling_service.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:iconly/iconly.dart';

class VideoCallPage extends StatefulWidget {
  final bool isVoiceCall;
  final String petOraganizationName;
  const VideoCallPage({super.key, required this.isVoiceCall, required this.petOraganizationName});

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  final socket = SignallingService.instance.socket;
  MediaStream? _localStream;
  RTCPeerConnection? _rtcPeerConnection;

  List<RTCIceCandidate> rtcIceCandidates = [];

  //media status
  bool isAudioOn = false, isVideoOn = false, isFrontCamera = true, isSpeakerOn = false;


  @override
  void initState(){
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    _setupPeerConnection();
    super.initState();
  }

  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  Future<void> _setupPeerConnection() async {
    try{
      _rtcPeerConnection = await createPeerConnection({
        'iceServers':[
          {
            'urls':[
              'stun:stun1.l.google.com:19302',
              'stun:stun2.l.google.com:19302'
            ]
          }
        ],
      });

    //listen for remotePeer mediaTrack event
    _rtcPeerConnection!.onTrack = (event){
      _remoteRenderer.srcObject = event.streams[0];
      setState(() {    
      });
    };

    //define valid constraites for getUserMedia
    final mediaConstraints = <String, dynamic>{
      'audio': isAudioOn,
      'video': isVideoOn?{'facingMode': isFrontCamera? 'user':'environment'}:false,
    };

    //at least one media type
    if(!isAudioOn && !isVideoOn){
      mediaConstraints['audio'] = true;
    }
    _localStream = await navigator.mediaDevices.getUserMedia(mediaConstraints);

    //add mediaTrack to peerConnection
    _localStream!.getTracks().forEach((track) {
      _rtcPeerConnection!.addTrack(track, _localStream!);
    });

  //set source for local video renderer
    _localRenderer.srcObject = _localStream;
    setState(() { });

    //for incoming call //need to retrieve the caller id from the previous page???
    // if(widget.offer !=null){} //need to assign in other page
    
    //listen for remote Candidate
    //add Candidate
    //set SDP offer as remoteDescription for peer Connection

    //Handle SDP and ICE candidates
    socket!.on("IceCandidate", (data) {
      String candidate = data["iceCandidate"]["candidate"];
      String sdpMid = data["iceCandidate"]["id"];
      int sdpMLineIndex = data["iceCandidate"]["label"];

      _rtcPeerConnection!.addCandidate(
        RTCIceCandidate(candidate, sdpMid, sdpMLineIndex),
      );
    });

    socket!.on("offerReceived", (data) async {
      await _rtcPeerConnection!.setRemoteDescription(
        RTCSessionDescription(data["sdpOffer"]["sdp"], data["sdpOffer"]["type"]),
      );

      RTCSessionDescription answer = await _rtcPeerConnection!.createAnswer();

      await _rtcPeerConnection!.setLocalDescription(answer);

      socket!.emit("answerCall", {
        //"callerId": 
        "sdpAnswer": answer.toMap(),
      });
    });

    }catch(e){
      debugPrint('Error setting up peer connection: $e');
    }
    
  }

  void _toggleMic(){
    isAudioOn = !isAudioOn;
    _localStream?.getAudioTracks().forEach((track) {
      track.enabled = isAudioOn;
    });
    setState((){});
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

  void _toggleCamera(){
    isVideoOn = !isVideoOn;
    _localStream?.getVideoTracks().forEach((track) {
      track.enabled = isVideoOn;
    });
    setState(() { });
  }

  void switchCamera(){
    isFrontCamera = !isFrontCamera;
    _localStream?.getVideoTracks().forEach((track) {
      track.switchCamera();
    });
    setState(() { });
  }

  void _endCall(){
    _localStream?.dispose();
    _rtcPeerConnection?.close();
    _rtcPeerConnection = null;
    socket?.emit('endCall'); //noti server
    Navigator.pop(context);
  }

  @override
  void dispose(){
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    _localStream?.dispose();
    _rtcPeerConnection?.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.shade600,
      //appBar: AppBar(),

      body: SafeArea(
        
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  RTCVideoView(_remoteRenderer, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover),
                if(!widget.isVoiceCall)
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: SizedBox(
                      height: 150,
                      width: 100,
                      child: RTCVideoView(
                        _localRenderer, mirror: isFrontCamera,
                        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(IconlyLight.arrow_left, color: Colors.white, size: 25),
                      onPressed: _endCall,
                    ),
                  ),

                
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 7,
                        child: Text(widget.petOraganizationName, style: heading4Bold.copyWith(color: Colors.white), overflow: TextOverflow.ellipsis,maxLines: 1,)
                      ),
                      const Flexible(
                        flex:3, child: SizedBox(),
                      
                      ),

                    ],
                  ),
                  Text('Duration',style: bodyXLMedium.copyWith(color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buttonWidget(isSpeakerOn? IconlyBold.volume_up: Icons.volume_off_rounded, Colors.white.withOpacity(0.3), _toggleSpeaker),
                      const SizedBox(width: 20),
                      _buttonWidget(isVideoOn? IconlyBold.video: Icons.videocam_off_rounded, Colors.white.withOpacity(0.3), _toggleCamera),
                      const SizedBox(width: 20),
                      _buttonWidget(isAudioOn? IconlyBold.voice: Icons.mic_off, Colors.white.withOpacity(0.3), _toggleMic),
                      const SizedBox(width: 20),
                      _buttonWidget(IconlyBold.call_missed, const Color(0xFFF75555), _endCall),
                    ],
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),

    );
  }

  Widget _buttonWidget(IconData icon, Color circleColour, VoidCallback tap){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: circleColour,
          child: IconButton(
            icon: Icon(icon, size: 25, color: Colors.white),
            onPressed: tap,
          ),
        ),
      ],
    );
  }
}