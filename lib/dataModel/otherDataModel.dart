class OtherDataModel{
  final String otherName;
  final String otherPic;
  final String distanceOther;
  final String otherBreed;

  OtherDataModel({
    required this.otherName,
    required this.otherPic,
    required this.distanceOther,
    required this.otherBreed,
  });

  OtherDataModel copyWith({
    String? otherName,
    String? otherPic,
    String? distanceOther,
    String? otherBreed,
  }){
    return OtherDataModel(
      otherName: otherName?? this.otherName, 
      otherPic: otherPic?? this.otherPic, 
      distanceOther: distanceOther?? this.distanceOther,
      otherBreed: otherBreed?? this.otherBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'otherName': otherName,
    'otherPic': otherPic,
    'distanceOther': distanceOther,
    'otherBreed': otherBreed,
  };

  factory OtherDataModel.fromJson(Map<String, dynamic>json) => OtherDataModel(
    otherName: json['otherName'], 
    otherPic: json['otherPic'], 
    distanceOther: json['distanceOther'], 
    otherBreed: json['otherBreed'],
  );


//temporary data model
  static List<OtherDataModel> otherCategoryList = [
     OtherDataModel(
      otherName: 'Bessie',
      otherPic: 'assets/image/bessie_cattle.jpg',
      distanceOther: '1.0km',
      otherBreed: 'Holstein',
    ),
    OtherDataModel(
      otherName: 'Shep',
      otherPic: 'assets/image/shep_sheep.jpg',
      distanceOther: '1.5km',
      otherBreed: 'Merino',
    ),
    OtherDataModel(
      otherName: 'Billy',
      otherPic: 'assets/image/billy_goat.jpg',
      distanceOther: '2.0km',
      otherBreed: 'Boer',
    ),
    OtherDataModel(
      otherName: 'Porky',
      otherPic: 'assets/image/porky_ferrets.jpg',
      distanceOther: '2.5km',
      otherBreed: 'Ferrets',
    ),
    OtherDataModel(
      otherName: 'Nibbles',
      otherPic: 'assets/image/nibbles_guinea_pig.jpg',
      distanceOther: '2.8km',
      otherBreed: 'Abyssinian Guinea Pig',
    ),
    OtherDataModel(
      otherName: 'Hammy',
      otherPic: 'assets/image/hammy_hamster.JPG',
      distanceOther: '3.0km',
      otherBreed: 'Syrian Hamster',
    ),
    OtherDataModel(
      otherName: 'Cutie',
      otherPic: 'assets/image/cutie_chinchillas.jpg',
      distanceOther: '3.2km',
      otherBreed: 'Chinchillas',
    ),

  ];

}