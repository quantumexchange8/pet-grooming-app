class CatDataModel{
  final String catName;
  final String catPic;
  final String distanceCat;
  final String catBreed;

  CatDataModel({
    required this.catName,
    required this.catPic,
    required this.distanceCat,
    required this.catBreed,
  });

  CatDataModel copyWith({
    String? catName,
    String? catPic,
    String? distanceCat,
    String? catBreed,
  }){
    return CatDataModel(
      catName: catName?? this.catName, 
      catPic: catPic?? this.catPic, 
      distanceCat: distanceCat?? this.distanceCat,
      catBreed: catBreed?? this.catBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'catName': catName,
    'catPic': catPic,
    'distanceCat': distanceCat,
    'catBreed': catBreed,
  };

  factory CatDataModel.fromJson(Map<String, dynamic>json) => CatDataModel(
    catName: json['catName'], 
    catPic: json['catPic'], 
    distanceCat: json['distanceCat'], 
    catBreed: json['catBreed'],
  );


//temporary data model
  static List<CatDataModel> catCategoryList = [
    CatDataModel(
      catName: 'Mochi', 
      catPic: 'assets/image/mochi_cat.png', 
      distanceCat: '1.2km', 
      catBreed: 'Abyssinian',
    ),

    CatDataModel(
      catName: 'Casper', 
      catPic: 'assets/image/casper_cat.png', 
      distanceCat: '1.2km', 
      catBreed: 'Manx',
    ),

    CatDataModel(
      catName: 'Willow', 
      catPic: 'assets/image/willow_cat.png', 
      distanceCat: '1.5km', 
      catBreed: 'Manx',
    ),

    CatDataModel(
      catName: 'Bella', 
      catPic: 'assets/image/bella_cat.jpg', 
      distanceCat: '1.6km', 
      catBreed: 'Persian',
    ),

    CatDataModel(
      catName: 'Milo', 
      catPic: 'assets/image/milo_cat.jpg', 
      distanceCat: '2.2km', 
      catBreed: 'Bengal',
    ),

    CatDataModel(
      catName: 'Shadow', 
      catPic: 'assets/image/shadow_cat.jpg', 
      distanceCat: '2.8km', 
      catBreed: 'Sphynx',
    ),

    CatDataModel(
      catName: 'Oliver',
      catPic: 'assets/image/oliver_cat.jpg',
      distanceCat: '3.1km',
      catBreed: 'British Shorthair',
    ),

    

  ];

}