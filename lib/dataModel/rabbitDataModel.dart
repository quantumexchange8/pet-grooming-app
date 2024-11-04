class RabbitDataModel{
  final String rabbitName;
  final String rabbitPic;
  final String distanceRabbit;
  final String rabbitBreed;

  RabbitDataModel({
    required this.rabbitName,
    required this.rabbitPic,
    required this.distanceRabbit,
    required this.rabbitBreed,
  });

  RabbitDataModel copyWith({
    String? rabbitName,
    String? rabbitPic,
    String? distanceRabbit,
    String? rabbitBreed,
  }){
    return RabbitDataModel(
      rabbitName: rabbitName?? this.rabbitName, 
      rabbitPic: rabbitPic?? this.rabbitPic, 
      distanceRabbit: distanceRabbit?? this.distanceRabbit,
      rabbitBreed: rabbitBreed?? this.rabbitBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'rabbitName': rabbitName,
    'rabbitPic': rabbitPic,
    'distanceRabbit': distanceRabbit,
    'rabbitBreed': rabbitBreed,
  };

  factory RabbitDataModel.fromJson(Map<String, dynamic>json) => RabbitDataModel(
    rabbitName: json['rabbitName'], 
    rabbitPic: json['rabbitPic'], 
    distanceRabbit: json['distanceRabbit'], 
    rabbitBreed: json['rabbitBreed'],
  );


//temporary data model
  static List<RabbitDataModel> rabbitcategoryList = [
    RabbitDataModel(
      rabbitName: 'Cottontail', 
      rabbitPic: 'assets/image/cottontail_rabbit.png', 
      distanceRabbit: '1.5km', 
      rabbitBreed: 'Beveren',
    ),

    RabbitDataModel(
      rabbitName: 'Clover', 
      rabbitPic: 'assets/image/clover_rabbit.png', 
      distanceRabbit: '1.2km', 
      rabbitBreed: 'Fauve de Bourgo',
    ),

    RabbitDataModel(
      rabbitName: 'Hazel', 
      rabbitPic: 'assets/image/hazel_rabbit.png', 
      distanceRabbit: '1.2km', 
      rabbitBreed: 'Dwarf Angora',
    ),

    RabbitDataModel(
      rabbitName: 'Pippin', 
      rabbitPic: 'assets/image/pippin_rabbit.png', 
      distanceRabbit: '2.1km', 
      rabbitBreed: 'Polish',
    ),

    RabbitDataModel(
      rabbitName: 'Whiskers', 
      rabbitPic: 'assets/image/whiskers_rabbit.png', 
      distanceRabbit: '2.4km', 
      rabbitBreed: 'Tan',
    ),

    RabbitDataModel(
      rabbitName: 'Muffin', 
      rabbitPic: 'assets/image/muffin_rabbit.png', 
      distanceRabbit: '2.4km', 
      rabbitBreed: 'Netherland Dwarf',
    ),

    

  ];

}