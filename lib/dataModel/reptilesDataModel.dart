class ReptileDataModel{
  final String reptileName;
  final String reptilePic;
  final String distanceReptile;
  final String reptileBreed;

  ReptileDataModel({
    required this.reptileName,
    required this.reptilePic,
    required this.distanceReptile,
    required this.reptileBreed,
  });

  ReptileDataModel copyWith({
    String? reptileName,
    String? reptilePic,
    String? distanceReptile,
    String? reptileBreed,
  }){
    return ReptileDataModel(
      reptileName: reptileName?? this.reptileName, 
      reptilePic: reptilePic?? this.reptilePic, 
      distanceReptile: distanceReptile?? this.distanceReptile,
      reptileBreed: reptileBreed?? this.reptileBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'reptileName': reptileName,
    'reptilePic': reptilePic,
    'distanceReptile': distanceReptile,
    'reptileBreed': reptileBreed,
  };

  factory ReptileDataModel.fromJson(Map<String, dynamic>json) => ReptileDataModel(
    reptileName: json['reptileName'], 
    reptilePic: json['reptilePic'], 
    distanceReptile: json['distanceReptile'], 
    reptileBreed: json['reptileBreed'],
  );


//temporary data model
  static List<ReptileDataModel> reptileCategoryList = [
    ReptileDataModel(
      reptileName: 'Spike', 
      reptilePic: 'assets/image/spike_reptile.jpg', 
      distanceReptile: '1.0km', 
      reptileBreed: 'Bearded Dragon',
    ),

    ReptileDataModel(
      reptileName: 'Slyther', 
      reptilePic: 'assets/image/slyther_reptile.jpg', 
      distanceReptile: '1.4km', 
      reptileBreed: 'Ball Python',
    ),

    ReptileDataModel(
      reptileName: 'Cleo', 
      reptilePic: 'assets/image/cleo_reptile.jpg', 
      distanceReptile: '1.7km', 
      reptileBreed: 'Leopard Gecko',
    ),

    ReptileDataModel(
      reptileName: 'Rango', 
      reptilePic: 'assets/image/rango_reptile.jpg', 
      distanceReptile: '2.1km', 
      reptileBreed: 'Chameleon',
    ),

    ReptileDataModel(
      reptileName: 'Mushu', 
      reptilePic: 'assets/image/mushu_reptile.jpg', 
      distanceReptile: '2.5km', 
      reptileBreed: 'Chinese Water Dragon', //ecllips
    ),

    ReptileDataModel(
      reptileName: 'Tango', 
      reptilePic: 'assets/image/tango_reptile.jpg', 
      distanceReptile: '2.9km', 
      reptileBreed: 'Corn Snake',
    ),

  ];

}