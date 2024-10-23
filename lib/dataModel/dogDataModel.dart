class DogDataModel{
  final String dogName;
  final String dogPic;
  final String distanceDog;
  final String dogBreed;

  DogDataModel({
    required this.dogName,
    required this.dogPic,
    required this.distanceDog,
    required this.dogBreed,
  });

  DogDataModel copyWith({
    String? dogName,
    String? dogPic,
    String? distanceDog,
    String? dogBreed,
  }){
    return DogDataModel(
      dogName: dogName?? this.dogName, 
      dogPic: dogPic?? this.dogPic, 
      distanceDog: distanceDog?? this.distanceDog,
      dogBreed: dogBreed?? this.dogBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'dogName': dogName,
    'dogPic': dogPic,
    'distanceDog': distanceDog,
    'dogBreed': dogBreed,
  };

  factory DogDataModel.fromJson(Map<String, dynamic>json) => DogDataModel(
    dogName: json['dogName'], 
    dogPic: json['dogPic'], 
    distanceDog: json['distanceDog'], 
    dogBreed: json['dogBreed'],
  );


//temporary data model
  static List<DogDataModel> dogCategoryList = [
    DogDataModel(
      dogName: 'Luna', 
      dogPic: 'assets/image/luna_dog.jpg', 
      distanceDog: '1.2km', 
      dogBreed: 'Chihuahua',
    ),

    DogDataModel(
      dogName: 'Rusty', 
      dogPic: 'assets/image/rusty_dog.png', 
      distanceDog: '1.2km', 
      dogBreed: 'Welsh Corgi',
    ),

    DogDataModel(
      dogName: 'Maverick', 
      dogPic: 'assets/image/maverick_dog.png', 
      distanceDog: '1.7km', 
      dogBreed: 'Great Dane',
    ),

    DogDataModel(
      dogName: 'Scout', 
      dogPic: 'assets/image/scout_dog.png', 
      distanceDog: '1.7km', 
      dogBreed: 'Afghan Hound',
    ),

    DogDataModel(
      dogName: 'Comet', 
      dogPic: 'assets/image/comet_dog.png', 
      distanceDog: '2.4km', 
      dogBreed: 'Jack Russell Terrier',
    ),

    DogDataModel(
      dogName: 'Pepper', 
      dogPic: 'assets/image/pepper_dog.png', 
      distanceDog: '2.4km', 
      dogBreed: 'American Eskimo',
    ),

  ];

}