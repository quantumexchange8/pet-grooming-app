class PrimateDataModel{
  final String primateName;
  final String primatePic;
  final String distancePrimate;
  final String primateBreed;

  PrimateDataModel({
    required this.primateName,
    required this.primatePic,
    required this.distancePrimate,
    required this.primateBreed,
  });

  PrimateDataModel copyWith({
    String? primateName,
    String? primatePic,
    String? distancePrimate,
    String? primateBreed,
  }){
    return PrimateDataModel(
      primateName: primateName?? this.primateName, 
      primatePic: primatePic?? this.primatePic, 
      distancePrimate: distancePrimate?? this.distancePrimate,
      primateBreed: primateBreed?? this.primateBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'primateName': primateName,
    'primatePic': primatePic,
    'distancePrimate': distancePrimate,
    'primateBreed': primateBreed,
  };

  factory PrimateDataModel.fromJson(Map<String, dynamic>json) => PrimateDataModel(
    primateName: json['primateName'], 
    primatePic: json['primatePic'], 
    distancePrimate: json['distancePrimate'], 
    primateBreed: json['primateBreed'],
  );


//temporary data model
  static List<PrimateDataModel> primateCategoryList = [
     PrimateDataModel(
      primateName: 'Chichi',
      primatePic: 'assets/image/chichi_primate.jpg',
      distancePrimate: '1.5km',
      primateBreed: 'Chimpanzee',
    ),
    PrimateDataModel(
      primateName: 'Bongo',
      primatePic: 'assets/image/bongo_primate.jpg',
      distancePrimate: '1.8km',
      primateBreed: 'Baboon',
    ),
    PrimateDataModel(
      primateName: 'Luna',
      primatePic: 'assets/image/luna_primate.jpg',
      distancePrimate: '2.1km',
      primateBreed: 'Lemur',
    ),
    PrimateDataModel(
      primateName: 'Koko',
      primatePic: 'assets/image/koko_primate.jpg',
      distancePrimate: '2.5km',
      primateBreed: 'Tamarin',
    ),
    PrimateDataModel(
      primateName: 'Taz',
      primatePic: 'assets/image/taz_primate.jpg',
      distancePrimate: '2.8km',
      primateBreed: 'Bushbaby',
    ),
    PrimateDataModel(
      primateName: 'Zuri',
      primatePic: 'assets/image/zuri_primate.jpg',
      distancePrimate: '3.0km',
      primateBreed: 'Capuchin Monkey',
    ),

  ];

}