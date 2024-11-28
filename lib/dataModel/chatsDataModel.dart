import 'package:adoptify/dataModel/messageInboxData.dart';


//chats at the message page
class ChatList{
  final String petOrganiationName;
  final String petOrganizationPicUrl;
  List<MessageInboxData> messageList;

  ChatList({
    required this.petOrganiationName,
    required this.petOrganizationPicUrl,
    required this.messageList, //show the latest message
  });
}


//sender is the user

List<ChatList> temporaryChatEg = [
  ChatList(
    petOrganiationName: 'Happy Tails Animal Rescue', //ownerName in ownerDetails
    petOrganizationPicUrl: 'assets/image/mochi_cat.png', 
    messageList: [
      MessageInboxData(
        messageText: 'Hi, is this adoption available?', 
        messageSentDateNTime: DateTime(2024,11,27,09,41),
        isSender: true,
      ),
    ],
  ),

  ChatList(
    petOrganiationName: 'Feline Friends Rescue', //ownerName in ownerDetails
    petOrganizationPicUrl: 'assets/logo/no_image.png', 
    messageList: [
      MessageInboxData(
        messageText: 'message', 
        messageSentDateNTime: DateTime(2024,11,27,11,50),
        isSender: true,
      ),
    ],
  ),

  ChatList(
    petOrganiationName: 'FurEver Friends', //ownerName in ownerDetails
    petOrganizationPicUrl: 'assets/logo/no_image.png', 
    messageList: [
      MessageInboxData(
        messageText: 'message', 
        messageSentDateNTime: DateTime(2024,11,27,06,50),
        isSender: true,
      ),
    ],
  ),





];