class BirdDataModel{
  final String birdName;
  final String birdPic;
  final String distanceBird;
  final String birdBreed;

  BirdDataModel({
    required this.birdName,
    required this.birdPic,
    required this.distanceBird,
    required this.birdBreed,
  });

  BirdDataModel copyWith({
    String? birdName,
    String? birdPic,
    String? distanceBird,
    String? birdBreed,
  }){
    return BirdDataModel(
      birdName: birdName?? this.birdName, 
      birdPic: birdPic?? this.birdPic, 
      distanceBird: distanceBird?? this.distanceBird,
      birdBreed: birdBreed?? this.birdBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'birdName': birdName,
    'birdPic': birdPic,
    'distanceBird': distanceBird,
    'birdBreed': birdBreed,
  };

  factory BirdDataModel.fromJson(Map<String, dynamic>json) => BirdDataModel(
    birdName: json['birdName'], 
    birdPic: json['birdPic'], 
    distanceBird: json['distanceBird'], 
    birdBreed: json['birdBreed'],
  );


//temporary data model
  static List<BirdDataModel> birdCategoryList = [
    BirdDataModel(
      birdName: 'Tweety', 
      birdPic: 'assets/image/tweety_bird.jpg', 
      distanceBird: '0.8km', 
      birdBreed: 'Canary',
    ),

    BirdDataModel(
      birdName: 'Skye', 
      birdPic: 'assets/image/skye_bird.jpg', 
      distanceBird: '1.2km', 
      birdBreed: 'Parrot',
    ),

    BirdDataModel(
      birdName: 'Kiwi', 
      birdPic: 'assets/image/kiwi_bird.jpg', 
      distanceBird: '1.6km', 
      birdBreed: 'Budgerigar',
    ),

    BirdDataModel(
      birdName: 'Sunny', 
      birdPic: 'assets/image/sunny_bird.png', 
      distanceBird: '2.0km', 
      birdBreed: 'Cockatiel',
    ),

    BirdDataModel(
      birdName: 'Rio', 
      birdPic: 'assets/image/rio_bird.jpg', 
      distanceBird: '2.3km', 
      birdBreed: 'Macaw',
    ),

    BirdDataModel(
      birdName: 'Peppy', 
      birdPic: 'assets/image/peppy_bird.jpg', 
      distanceBird: '2.6km', 
      birdBreed: 'Lovebird',
    ),

  ];

}