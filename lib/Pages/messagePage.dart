import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/callsHistoryDataModel.dart';
import 'package:adoptify/dataModel/chatsDataModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:iconly/iconly.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

int selectedIndex = 0;

List<String> get messageOrChats {
  //int chatUnreadCount = 
  return ["Chats", "Calls"];
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo/paw_small.png'),
        title: Text(context.tr('Messages'), style: heading4Bold),
        centerTitle: true,
        actions: [ 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(IconlyLight.search, size: 25),
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 30)
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlutterToggleTab(
              width: 92,
              borderRadius: 5,
              labels: messageOrChats, 
              selectedBackgroundColors: [primaryOrange.shade700],
              selectedTextStyle: bodyLBold.copyWith(color: Colors.white),
              unSelectedBackgroundColors: [Theme.of(context).colorScheme.secondary],
              unSelectedTextStyle: bodyLBold.copyWith(color: Theme.of(context).colorScheme.primary),
              selectedLabelIndex: (index){
                setState(() {
                  selectedIndex = index;
                });
              }, 
              selectedIndex: selectedIndex,
            ),
      
            selectedIndex == 0? _chatsRecord(): _callsHistory(),
            
          ],
        ),
      ),
    );
  }

  Widget _chatsRecord(){
    return Expanded(
      child: ListView.builder(
        itemCount: temporaryChatEg.length,
        itemBuilder: (context, index){
          final messageList = temporaryChatEg[index];
          final latestMessage = messageList.messageList.last;
          final formattedTime = DateFormat('HH:mm').format(latestMessage.messageSentDateNTime);
      
          return ListTile(
            leading: Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(messageList.petOrganizationPicUrl),
                )
              ),
              
            ),

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 7,
                  child: Text(messageList.petOrganiationName, style: heading6Bold, overflow: TextOverflow.ellipsis, maxLines: 1)
                ),
                const Flexible(
                  flex: 2,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 1,
                  child: Text('noti1', style: bodyMMedium.copyWith(color: grey.shade700), overflow: TextOverflow.ellipsis, maxLines: 1)
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 7,
                  child: Text(
                    /* messageList.messageList.map((e) => e.messageText).toString() */
                    latestMessage.messageText, style: bodyMMedium.copyWith(color: grey.shade700), overflow: TextOverflow.ellipsis, maxLines: 1)
                ),
                const Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    /* messageList.messageList.map((e) => e.messageSentDateNTime).toString() */
                    formattedTime, style: bodyMMedium.copyWith(color: grey.shade700), overflow: TextOverflow.ellipsis, maxLines: 1)
                ),
              ],
            ),

            onTap: (){},
            
          );
        }
      ),
    );
  }

  Widget _callsHistory(){
    return Expanded(
      child: ListView.builder(
        itemCount: callsTemporaryHistory.length,
        itemBuilder: (context, index){
          final calls = callsTemporaryHistory[index];

          IconData callIcon;
          Color iconColor;

          if(calls.isCallAccept){
            if(calls.isVoiceCall){
              callIcon = Icons.arrow_downward_outlined;
              iconColor = Colors.green;
            }else{
              callIcon = Icons.arrow_downward_outlined;
              iconColor = Colors.green;
            }
          }else{
            if(calls.isVoiceCall){
              callIcon = Icons.arrow_outward_outlined;
              iconColor = Colors.red;
            }else{
              callIcon = Icons.arrow_outward_outlined;
              iconColor = Colors.red;
            }
          }

          final formattedTime = DateFormat('MM dd, HH:mm ').format(calls.callDateTime);
      
          return ListTile(
            leading: Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(calls.petOrganizationPicUrl),
                )
              ),              
            ),

            title: Text(calls.petOrganizationName, style: heading6Bold, overflow: TextOverflow.ellipsis, maxLines: 1),
            subtitle: Row(
              children: [
                Icon(callIcon, size: 15, color: iconColor),
                // Icon(Icons.arrow_outward_outlined, size: 15), //green color: user call, red color: did not pick up call user called
                //Icon(Icons.arrow_downward_outlined), //green color: user pick up call, red color: missed call
                const SizedBox(width: 8),
                Text(formattedTime, style: bodyMMedium.copyWith(color: grey.shade700), overflow: TextOverflow.ellipsis, maxLines: 1)
              ],
            ),
            trailing: Icon(
              calls.isVoiceCall?  IconlyLight.call: IconlyLight.video, color: primaryOrange.shade900
            ),

            onTap: (){},

          );
        }
      ),
    );
  }



}