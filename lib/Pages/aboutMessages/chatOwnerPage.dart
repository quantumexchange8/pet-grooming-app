import 'package:adoptify/Pages/aboutMessages/videoCallPage.dart';
import 'package:adoptify/Pages/aboutMessages/voiceCallPage.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/callsHistoryDataModel.dart';
import 'package:adoptify/dataModel/chatsDataModel.dart';
import 'package:adoptify/dataModel/messageInboxData.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChatOwnerPage extends StatefulWidget {
  final ChatList chat;
  const ChatOwnerPage({super.key, required this.chat});

  @override
  State<ChatOwnerPage> createState() => _ChatOwnerPageState();
}

class _ChatOwnerPageState extends State<ChatOwnerPage> {

  final TextEditingController messageController = TextEditingController();

  String formatTime(DateTime dateTime) {
    final timeOfDay = TimeOfDay.fromDateTime(dateTime);
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return '${hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')} $period';
  }

  void _sendMessage(){
    final text = messageController.text.trim();
    if(text.isNotEmpty){
      setState(() {
        widget.chat.messageList.add(
          MessageInboxData(
            petOrganizationName: widget.chat.petOrganiationName, 
            userId: '', 
            messageText: text, 
            messageSentDateNTime: DateTime.now(), 
            isUser: true,
          ),
        );
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(widget.chat.petOrganiationName, style: heading4Bold), // make it ecllips
        centerTitle: true,
        actions: [
          IconButton( 
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=> VideoCallPage(isVoiceCall: false, petOraganizationName: widget.chat.petOrganiationName),
                ),
              );
            },
            icon: const Icon(IconlyLight.video, size: 25),
            
          ), 

          IconButton(
            onPressed: (){
              final callsHistory = CallsHistoryData(
                petOrganizationName: widget.chat.petOrganiationName, 
                petOrganizationPicUrl: widget.chat.petOrganizationPicUrl, 
                callDateTime: DateTime.now(), 
                isVoiceCall: true, 
                isCallAccept: true, //need to edit
              );
              
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=> VoiceCallPage(callHistory: callsHistory),
                ),
              );
            }, 
            icon: const Icon(IconlyLight.call, size: 25)
          ),

        ],
    
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.chat.messageList.length,
              itemBuilder: (context, index){
                final message = widget.chat.messageList[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    message.isUser? 64.0 : 16.0, 4 , message.isUser?16.0:64.0 , 4
                    //left, top, right, bottom
                  ),
                  child: Align(
                    alignment: message.isUser? Alignment.centerRight: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: message.isUser? primaryOrange.shade900: Theme.of(context).colorScheme.tertiaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(message.messageText, style: bodyXLMedium.copyWith(color: message.isUser? Colors.white: Theme.of(context).colorScheme.primary)),
                              ),
                            ),
                            Positioned(
                              bottom: 1,
                              right: 8,
                              child: Text(formatTime(message.messageSentDateNTime), 
                                    style: bodyXSMedium.copyWith(color: message.isUser? Colors.white: Theme.of(context).colorScheme.primary)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),
                      ],
                    ),
                    
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              shadowColor: Colors.white,
              child: _buildMessageInput(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context){ //need attachment
    final TextEditingController messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [

          //message input
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.emoji_emotions_outlined, color: Theme.of(context).colorScheme.primary),
                  onPressed: (){},
                ),
                hintText: 'Message...',
                hintStyle: bodyLRegular.copyWith(color: grey.shade500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).colorScheme.tertiaryContainer,
                filled: true,
              ),
            ),
          ),

          /* IconButton(
            icon: Icon(Icons.attach_file_outlined, color: Theme.of(context).colorScheme.primary),
            onPressed: (){},
          ), */

          //send button
          IconButton(
            onPressed: _sendMessage,
            icon: Container(
              width: 35, height: 35,
              decoration: BoxDecoration(
                color: primaryOrange.shade900,
                shape: BoxShape.circle
              ),
              child: const Icon(IconlyBold.send, color: Colors.white, size: 25),
            ),
          ),

        ],
      ),
    );
  }


}