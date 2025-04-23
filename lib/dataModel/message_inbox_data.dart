
//message details after click the chat at the message page

class MessageInboxData{
  final String petOrganizationName;
  final String userId;
  final String messageText;
  final DateTime messageSentDateNTime;
  final String? photo;
  final bool isUser;
  

  MessageInboxData({
    required this.petOrganizationName,
    required this.userId,
    required this.messageText,
    required this.messageSentDateNTime,
    this.photo,
    required this.isUser,
  });
}


List<MessageInboxData> messageDetails = [
  MessageInboxData(
    petOrganizationName: '',
    userId: '',
    messageText: 'Hello, I want to adopt Mochi.', 
    messageSentDateNTime: DateTime(2024,11,27,09,41),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: '',
    userId: '',
    messageText: 'Hello, I want to adopt Mochi.', 
    messageSentDateNTime: DateTime(2024,11,27,09,41),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: '',
    userId: '',
    messageText: 'Hello, I want to adopt Mochi.', 
    messageSentDateNTime: DateTime(2024,11,27,09,41),
    isUser: true,
  ),

  MessageInboxData(
    petOrganizationName: '',
    userId: '',
    messageText: 'Hello, I want to adopt Mochi.', 
    messageSentDateNTime: DateTime(2024,11,27,09,41),
    isUser: true,
  ),

  
];