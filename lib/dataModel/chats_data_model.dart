import 'package:adoptify/dataModel/message_inbox_data.dart';
import 'package:collection/collection.dart';

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

List<ChatList> messageListIntoChat (List<MessageInboxData> messages){
  final groupedMessages = groupBy(
    messages,
    (MessageInboxData message) => message.petOrganizationName,
  );
  return groupedMessages.entries.map((entry) {
    final organizationName = entry.key;
    final messageGroup = entry.value;
    messageGroup.sort((a,b)=> b.messageSentDateNTime.compareTo(a.messageSentDateNTime));

    return ChatList(
      petOrganiationName: organizationName, 
      petOrganizationPicUrl: _getOrganizationImage(organizationName), 
      messageList: messageGroup,
    );
  }).toList();

}  
String _getOrganizationImage(String organizationName){
  const organizationImageMap = {
    'Happy Tails Animal Rescue': 'assets/image/mochi_cat.png',
    'Feline Friends Rescue': 'assets/logo/no_image.png',
    'FurEver Friends': 'assets/logo/no_image.png',
  };

  return organizationImageMap[organizationName] ?? 'assets/logo/no_image.png';
}

List<MessageInboxData> messageDetails = [
  MessageInboxData(
    petOrganizationName: 'Happy Tails Animal Rescue', 
    userId: 'User 1', 
    messageText: 'Hello, I want to adopt Mochi.', 
    messageSentDateNTime: DateTime(2024, 11, 27, 9, 41),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: 'Happy Tails Animal Rescue', 
    userId: 'User 1', 
    messageText: 'Hi, of course. You can come firectly to our address to see and adopt Mochi.', 
    messageSentDateNTime: DateTime(2024, 11, 27, 9, 42),
    isUser: false,
  ),

  MessageInboxData(
    petOrganizationName: 'Happy Tails Animal Rescue', 
    userId: 'User 1', 
    messageText: 'Before I adopt Mochi, can I call you to see Mochi\'s current condition?', 
    messageSentDateNTime: DateTime(2024, 11, 27, 9, 43),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: 'Happy Tails Animal Rescue', 
    userId: 'User 1', 
    messageText: 'Sure, we can call now so you can see Mochi.', 
    messageSentDateNTime: DateTime(2024, 11, 27, 9, 43),
    isUser: false,
  ),

  MessageInboxData(
    petOrganizationName: 'Feline Friends Rescue', 
    userId: 'User 1', 
    messageText: 'Hi, is this adoption still available?', 
    messageSentDateNTime: DateTime(2024, 11, 28, 03, 12),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: 'Feline Friends Rescue', 
    userId: 'User 1', 
    messageText: 'I have some questions about the adoption process.', 
    messageSentDateNTime: DateTime(2024, 11, 28, 03, 13),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: 'FurEver Friends', 
    userId: 'User 1', 
    messageText: 'Hi, is any cat here can be adopted?', 
    messageSentDateNTime: DateTime(2024, 11, 28, 11, 25),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: 'FurEver Friends', 
    userId: 'User 1', 
    messageText: 'Hi, can I have your personal details?', 
    messageSentDateNTime: DateTime(2024, 11, 28, 03, 15),
    isUser: false,
  ),
];

List <ChatList> chatList = messageListIntoChat(messageDetails);

List<ChatList> temporaryChatEg = [
  ChatList(
    petOrganiationName: 'Happy Tails Animal Rescue',
    petOrganizationPicUrl: 'assets/image/mochi_cat.png',
    messageList: [
      MessageInboxData(
        petOrganizationName: 'Happy Tails Animal Rescue',
        userId: 'User 1',
        messageText: 'Hello, I want to adopt Mochi.',
        messageSentDateNTime: DateTime(2024, 11, 27, 9, 41),
        isUser: true,
      ),
      MessageInboxData(
        petOrganizationName: 'Happy Tails Animal Rescue',
        userId: 'User 1',
        messageText: 'Hi, of course. You can come directly to our address to see and adopt Mochi.',
        messageSentDateNTime: DateTime(2024, 11, 27, 9, 42),
        isUser: false,
      ),
      MessageInboxData(
        petOrganizationName: 'Happy Tails Animal Rescue', 
        userId: 'User 1', 
        messageText: 'Before I adopt Mochi, can I call you to see Mochi\'s current condition?', 
        messageSentDateNTime: DateTime(2024, 11, 27, 9, 43),
        isUser: true,
      ),
      MessageInboxData(
        petOrganizationName: 'Happy Tails Animal Rescue', 
        userId: 'User 1', 
        messageText: 'Sure, we can call now so you can see Mochi.', 
        messageSentDateNTime: DateTime(2024, 11, 27, 9, 43),
        isUser: false,
      ),
    ],
  ),
  ChatList(
    petOrganiationName: 'Feline Friends Rescue',
    petOrganizationPicUrl: 'assets/logo/no_image.png',
    messageList: [
      MessageInboxData(
        petOrganizationName: 'Feline Friends Rescue',
        userId: 'User 1',
        messageText: 'Hi, is this adoption still available?',
        messageSentDateNTime: DateTime(2024, 11, 28, 3, 12),
        isUser: true,
      ),
      MessageInboxData(
        petOrganizationName: 'Feline Friends Rescue',
        userId: 'User 1',
        messageText: 'I have some questions about the adoption process.',
        messageSentDateNTime: DateTime(2024, 11, 28, 3, 13),
        isUser: true,
      ),
    ],
  ),
  ChatList(
    petOrganiationName: 'FurEver Friends',
    petOrganizationPicUrl: 'assets/logo/no_image.png',
    messageList: [
      MessageInboxData(
        petOrganizationName: 'FurEver Friends',
        userId: 'User 1',
        messageText: 'Hi, is any cat here available for adoption?',
        messageSentDateNTime: DateTime(2024, 11, 28, 11, 25),
        isUser: true,
      ),
      MessageInboxData(
        petOrganizationName: 'FurEver Friends',
        userId: 'User 1',
        messageText: 'Hi, can I have your personal details?',
        messageSentDateNTime: DateTime(2024, 11, 28, 3, 15),
        isUser: false,
      ),
    ],
  ),
];

/* List<ChatList> temporaryChatEg = [
  ChatList(
    petOrganiationName: 'Happy Tails Animal Rescue', //ownerName in ownerDetails
    petOrganizationPicUrl: 'assets/image/mochi_cat.png', 
    messageList: [
      MessageInboxData(
        petOrganizationName: '',
        userId: '',
        messageText: 'Hi, is this adoption available?', 
        messageSentDateNTime: DateTime(2024,11,27,09,41),
        isUser: true,
      ),
    ],
  ),

  ChatList(
    petOrganiationName: 'Feline Friends Rescue', //ownerName in ownerDetails
    petOrganizationPicUrl: 'assets/logo/no_image.png', 
    messageList: [
      MessageInboxData(
        petOrganizationName: '',
        userId: '',
        messageText: 'message', 
        messageSentDateNTime: DateTime(2024,11,27,11,50),
        isUser: true,
      ),
    ],
  ),

  ChatList(
    petOrganiationName: 'FurEver Friends', //ownerName in ownerDetails
    petOrganizationPicUrl: 'assets/logo/no_image.png', 
    messageList: [
      MessageInboxData(
        petOrganizationName: '',
        userId: '',
        messageText: 'message', 
        messageSentDateNTime: DateTime(2024,11,27,06,50),
        isUser: true,
      ),
    ],
  ),

]; */