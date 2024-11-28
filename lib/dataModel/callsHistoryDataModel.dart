
//calls at the message page

class CallsHistoryData{
  final String petOrganizationName;
  final String petOrganizationPicUrl;
  final DateTime callDateTime;
  final bool isVoiceCall;
  final bool isCallAccept;
  // final bool isCallReach;

  CallsHistoryData({
    required this.petOrganizationName,
    required this.petOrganizationPicUrl,
    required this.callDateTime,
    required this.isVoiceCall,
    required this.isCallAccept,
    // required this.isCallReach,
  });

}

List<CallsHistoryData> callsTemporaryHistory = [
  CallsHistoryData(
    petOrganizationName: 'Happy Tail Animal Rescue', 
    petOrganizationPicUrl: 'assets/image/bella_cat.jpg',
    callDateTime: DateTime(2024,11,27,09,41), 
    isVoiceCall: false, 
    isCallAccept: true, 
    // isCallReach: null,
  ),

  CallsHistoryData(
    petOrganizationName: 'Feline Friends Rescue', 
    petOrganizationPicUrl: 'assets/logo/no_image.png',
    callDateTime: DateTime(2024,11,28,11,12), 
    isVoiceCall: true, 
    isCallAccept: true, 
    // isCallReach: null,
  ),

  CallsHistoryData(
    petOrganizationName: 'FurEver Friends', 
    petOrganizationPicUrl: 'assets/image/casper_cat.png',
    callDateTime: DateTime(2024,11,04,05,22), 
    isVoiceCall: true, 
    isCallAccept: false, 
    // isCallReach: null,
  ),

  CallsHistoryData(
    petOrganizationName: 'Gentle Paws', 
    petOrganizationPicUrl: 'assets/logo/no_image.png',
    callDateTime: DateTime(2024,11,30,12,02), 
    isVoiceCall: false, 
    isCallAccept: false, 
    // isCallReach: null,
  ),

  CallsHistoryData(
    petOrganizationName: 'Whiskers & Paws Shelter', 
    petOrganizationPicUrl: 'assets/image/shadow_cat.jpg',
    callDateTime: DateTime(2024,11,22,03,12), 
    isVoiceCall: false, 
    isCallAccept: false, 
    // isCallReach: null,
  ),

  CallsHistoryData(
    petOrganizationName: 'Paws & Love Shelter', 
    petOrganizationPicUrl: 'assets/logo/no_image.png',
    callDateTime: DateTime(2024,11,14,11,19), 
    isVoiceCall: true, 
    isCallAccept: true, 
    // isCallReach: null,
  ),


];