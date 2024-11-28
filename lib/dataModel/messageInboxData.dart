
//message details after click the chat at the message page

class MessageInboxData{
  final String messageText;
  final DateTime messageSentDateNTime;
  final String? photo;
  final bool isSender;
  

  MessageInboxData({
    required this.messageText,
    required this.messageSentDateNTime,
    this.photo,
    required this.isSender,
  });
}


List<MessageInboxData> messageDetails = [
  MessageInboxData(
    messageText: 'Hello, I want to adopt Mochi.', 
    messageSentDateNTime: DateTime(2024,11,27,09,41),
    isSender: true,
  ),
];