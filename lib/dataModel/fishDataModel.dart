class FishDataModel{
  final String fishName;
  final String fishPic;
  final String distanceFish;
  final String fishBreed;

  FishDataModel({
    required this.fishName,
    required this.fishPic,
    required this.distanceFish,
    required this.fishBreed,
  });

  FishDataModel copyWith({
    String? fishName,
    String? fishPic,
    String? distanceFish,
    String? fishBreed,
  }){
    return FishDataModel(
      fishName: fishName?? this.fishName, 
      fishPic: fishPic?? this.fishPic, 
      distanceFish: distanceFish?? this.distanceFish,
      fishBreed: fishBreed?? this.fishBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'fishName': fishName,
    'fishPic': fishPic,
    'distanceFish': distanceFish,
    'fishBreed': fishBreed,
  };

  factory FishDataModel.fromJson(Map<String, dynamic>json) => FishDataModel(
    fishName: json['fishName'], 
    fishPic: json['fishPic'], 
    distanceFish: json['distanceFish'], 
    fishBreed: json['fishBreed'],
  );


//temporary data model
  static List<FishDataModel> fishCategoryList = [
    FishDataModel(
      fishName: 'Goldie',
      fishPic: 'assets/image/goldie_fish.jpg',
      distanceFish: '1.1km',
      fishBreed: 'Goldfish',
    ),
    FishDataModel(
      fishName: 'Bubbles',
      fishPic: 'assets/image/bubbles_fish.png',
      distanceFish: '1.4km',
      fishBreed: 'Betta Fish',
    ),
    FishDataModel(
      fishName: 'Splash',
      fishPic: 'assets/image/splash_fish.jpg',
      distanceFish: '1.8km',
      fishBreed: 'Guppy',
    ),
    FishDataModel(
      fishName: 'Flipper',
      fishPic: 'assets/image/flipper_fish.jpg',
      distanceFish: '2.0km',
      fishBreed: 'Clownfish',
    ),
    FishDataModel(
      fishName: 'Coral',
      fishPic: 'assets/image/coral_fish.jpg',
      distanceFish: '2.4km',
      fishBreed: 'Tetra',
    ),
    FishDataModel(
      fishName: 'Finley',
      fishPic: 'assets/image/finley_fish.jpg',
      distanceFish: '2.8km',
      fishBreed: 'Angelfish',
    ),

  ];

}