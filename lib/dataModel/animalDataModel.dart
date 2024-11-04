class AnimalDataModel{
  final String animalName;
  final String animalPic;
  final String animalType;
  final String distanceAnimal;
  final String animalBreed;

  AnimalDataModel({
    required this.animalName,
    required this.animalPic,
    required this.animalType,
    required this.distanceAnimal,
    required this.animalBreed,
  });

  AnimalDataModel copyWith({
    String? animalName,
    String? animalPic,
    String? animalType,
    String? distanceAnimal,
    String? animalBreed,
  }){
    return AnimalDataModel(
      animalName: animalName?? this.animalName, 
      animalPic: animalPic?? this.animalPic, 
      animalType: animalType?? this.animalType,
      distanceAnimal: distanceAnimal?? this.distanceAnimal,
      animalBreed: animalBreed?? this.animalBreed,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'animalName': animalName,
    'animalPic': animalPic,
    'animalType': animalType,
    'distanceAnimal': distanceAnimal,
    'animalBreed': animalBreed,
  };

  factory AnimalDataModel.fromJson(Map<String, dynamic>json) => AnimalDataModel(
    animalName: json['animalName'], 
    animalPic: json['animalPic'], 
    animalType: json['animalType'],
    distanceAnimal: json['distanceAnimal'], 
    animalBreed: json['animalBreed'],
  );


//temporary data model

  static List<AnimalDataModel> animalAnimalegoryList = [
    AnimalDataModel(
      animalName: 'Tweety', 
      animalPic: 'assets/image/tweety_bird.jpg', 
      animalType: 'Birds',
      distanceAnimal: '0.8km', 
      animalBreed: 'Canary',
    ),

    AnimalDataModel(
      animalName: 'Skye', 
      animalPic: 'assets/image/skye_bird.jpg', 
      animalType: 'Birds',
      distanceAnimal: '1.2km', 
      animalBreed: 'Parrot',
    ),

    AnimalDataModel(
      animalName: 'Kiwi', 
      animalPic: 'assets/image/kiwi_bird.jpg', 
      animalType: 'Birds',
      distanceAnimal: '1.6km', 
      animalBreed: 'Budgerigar',
    ),

    AnimalDataModel(
      animalName: 'Sunny', 
      animalPic: 'assets/image/sunny_bird.png', 
      animalType: 'Birds',
      distanceAnimal: '2.0km', 
      animalBreed: 'Cockatiel',
    ),

    AnimalDataModel(
      animalName: 'Rio', 
      animalPic: 'assets/image/rio_bird.jpg', 
      animalType: 'Birds',
      distanceAnimal: '2.3km', 
      animalBreed: 'Macaw',
    ),

    AnimalDataModel(
      animalName: 'Peppy', 
      animalPic: 'assets/image/peppy_bird.jpg', 
      animalType: 'Birds',
      distanceAnimal: '2.6km', 
      animalBreed: 'Loveanimal',
    ),

    AnimalDataModel(
      animalName: 'Mochi', 
      animalPic: 'assets/image/mochi_cat.png', 
      animalType: 'Cats',
      distanceAnimal: '1.2km', 
      animalBreed: 'Abyssinian',
    ),

    AnimalDataModel(
      animalName: 'Casper', 
      animalPic: 'assets/image/casper_cat.png',
      animalType: 'Cats', 
      distanceAnimal: '1.2km', 
      animalBreed: 'Manx',
    ),

    AnimalDataModel(
      animalName: 'Willow', 
      animalPic: 'assets/image/willow_cat.png', 
      animalType: 'Cats',
      distanceAnimal: '1.5km', 
      animalBreed: 'Manx',
    ),

    AnimalDataModel(
      animalName: 'Bella', 
      animalPic: 'assets/image/bella_cat.jpg', 
      animalType: 'Cats',
      distanceAnimal: '1.6km', 
      animalBreed: 'Persian',
    ),

    AnimalDataModel(
      animalName: 'Milo', 
      animalPic: 'assets/image/milo_cat.jpg', 
      animalType: 'Cats',
      distanceAnimal: '2.2km', 
      animalBreed: 'Bengal',
    ),

    AnimalDataModel(
      animalName: 'Shadow', 
      animalPic: 'assets/image/shadow_cat.jpg', 
      animalType: 'Cats',
      distanceAnimal: '2.8km', 
      animalBreed: 'Sphynx',
    ),

    AnimalDataModel(
      animalName: 'Oliver',
      animalPic: 'assets/image/oliver_cat.jpg',
      animalType: 'Cats',
      distanceAnimal: '3.1km',
      animalBreed: 'British Shorthair',
    ),

    AnimalDataModel(
      animalName: 'Luna', 
      animalPic: 'assets/image/luna_dog.jpg', 
      animalType: 'Dogs',
      distanceAnimal: '1.2km', 
      animalBreed: 'Chihuahua',
    ),

    AnimalDataModel(
      animalName: 'Rusty', 
      animalPic: 'assets/image/rusty_dog.png', 
      animalType: 'Dogs',
      distanceAnimal: '1.2km', 
      animalBreed: 'Welsh Corgi',
    ),

    AnimalDataModel(
      animalName: 'Maverick', 
      animalPic: 'assets/image/maverick_dog.png', 
      animalType: 'Dogs',
      distanceAnimal: '1.7km', 
      animalBreed: 'Great Dane',
    ),

    AnimalDataModel(
      animalName: 'Scout', 
      animalPic: 'assets/image/scout_dog.png', 
      animalType: 'Dogs',
      distanceAnimal: '1.7km', 
      animalBreed: 'Afghan Hound',
    ),

    AnimalDataModel(
      animalName: 'Comet', 
      animalPic: 'assets/image/comet_dog.png', 
      animalType: 'Dogs',
      distanceAnimal: '2.4km', 
      animalBreed: 'Jack Russell Terrier',
    ),

    AnimalDataModel(
      animalName: 'Pepper', 
      animalPic: 'assets/image/pepper_dog.png', 
      animalType: 'Dogs',
      distanceAnimal: '2.4km', 
      animalBreed: 'American Eskimo',
    ),

    AnimalDataModel(
      animalName: 'Goldie',
      animalPic: 'assets/image/goldie_fish.jpg',
      animalType: 'Fish',
      distanceAnimal: '1.1km',
      animalBreed: 'GoldAnimal',
    ),
    AnimalDataModel(
      animalName: 'Bubbles',
      animalPic: 'assets/image/bubbles_fish.png',
      animalType: 'Fish',
      distanceAnimal: '1.4km',
      animalBreed: 'Betta Animal',
    ),
    AnimalDataModel(
      animalName: 'Splash',
      animalPic: 'assets/image/splash_fish.jpg',
      animalType: 'Fish',
      distanceAnimal: '1.8km',
      animalBreed: 'Guppy',
    ),
    AnimalDataModel(
      animalName: 'Flipper',
      animalPic: 'assets/image/flipper_fish.jpg',
      animalType: 'Fish',
      distanceAnimal: '2.0km',
      animalBreed: 'ClownAnimal',
    ),
    AnimalDataModel(
      animalName: 'Coral',
      animalPic: 'assets/image/coral_fish.jpg',
      animalType: 'Fish',
      distanceAnimal: '2.4km',
      animalBreed: 'Tetra',
    ),
    AnimalDataModel(
      animalName: 'Finley',
      animalPic: 'assets/image/finley_fish.jpg',
      animalType: 'Fish',
      distanceAnimal: '2.8km',
      animalBreed: 'AngelAnimal',
    ),

    AnimalDataModel(
      animalName: 'Cottontail', 
      animalPic: 'assets/image/cottontail_rabbit.png', 
      animalType: 'Rabbits',
      distanceAnimal: '1.5km', 
      animalBreed: 'Beveren',
    ),

    AnimalDataModel(
      animalName: 'Clover', 
      animalPic: 'assets/image/clover_rabbit.png', 
      animalType: 'Rabbits',
      distanceAnimal: '1.2km', 
      animalBreed: 'Fauve de Bourgo',
    ),

    AnimalDataModel(
      animalName: 'Hazel', 
      animalPic: 'assets/image/hazel_rabbit.png', 
      animalType: 'Rabbits',
      distanceAnimal: '1.2km', 
      animalBreed: 'Dwarf Angora',
    ),

    AnimalDataModel(
      animalName: 'Pippin', 
      animalPic: 'assets/image/pippin_rabbit.png', 
      animalType: 'Rabbits',
      distanceAnimal: '2.1km', 
      animalBreed: 'Polish',
    ),

    AnimalDataModel(
      animalName: 'Whiskers', 
      animalPic: 'assets/image/whiskers_rabbit.png', 
      animalType: 'Rabbits',
      distanceAnimal: '2.4km', 
      animalBreed: 'Tan',
    ),

    AnimalDataModel(
      animalName: 'Muffin', 
      animalPic: 'assets/image/muffin_rabbit.png', 
      animalType: 'Rabbits',
      distanceAnimal: '2.4km', 
      animalBreed: 'Netherland Dwarf',
    ),

    AnimalDataModel(
      animalName: 'Chichi',
      animalPic: 'assets/image/chichi_primate.jpg',
      animalType: 'Primates',
      distanceAnimal: '1.5km',
      animalBreed: 'Chimpanzee',
    ),

    AnimalDataModel(
      animalName: 'Bongo',
      animalPic: 'assets/image/bongo_primate.jpg',
      animalType: 'Primates',
      distanceAnimal: '1.8km',
      animalBreed: 'Baboon',
    ),

    AnimalDataModel(
      animalName: 'Lunna',
      animalPic: 'assets/image/luna_primate.jpg',
      animalType: 'Primates',
      distanceAnimal: '2.1km',
      animalBreed: 'Lemur',
    ),

    AnimalDataModel(
      animalName: 'Koko',
      animalPic: 'assets/image/koko_primate.jpg',
      animalType: 'Primates',
      distanceAnimal: '2.5km',
      animalBreed: 'Tamarin',
    ),

    AnimalDataModel(
      animalName: 'Taz',
      animalPic: 'assets/image/taz_primate.jpg',
      animalType: 'Primates',
      distanceAnimal: '2.8km',
      animalBreed: 'Bushbaby',
    ),

    AnimalDataModel(
      animalName: 'Zuri',
      animalPic: 'assets/image/zuri_primate.jpg',
      animalType: 'Primates',
      distanceAnimal: '3.0km',
      animalBreed: 'Capuchin Monkey',
    ),

    AnimalDataModel(
      animalName: 'Spike', 
      animalPic: 'assets/image/spike_reptile.jpg', 
      animalType: 'Reptiles',
      distanceAnimal: '1.0km', 
      animalBreed: 'Bearded Dragon',
    ),

    AnimalDataModel(
      animalName: 'Slyther', 
      animalPic: 'assets/image/slyther_reptile.jpg', 
      animalType: 'Reptiles',
      distanceAnimal: '1.4km', 
      animalBreed: 'Ball Python',
    ),

    AnimalDataModel(
      animalName: 'Cleo', 
      animalPic: 'assets/image/cleo_reptile.jpg', 
      animalType: 'Reptiles',
      distanceAnimal: '1.7km', 
      animalBreed: 'Leopard Gecko',
    ),

    AnimalDataModel(
      animalName: 'Rango', 
      animalPic: 'assets/image/rango_reptile.jpg', 
      animalType: 'Reptiles',
      distanceAnimal: '2.1km', 
      animalBreed: 'Chameleon',
    ),

    AnimalDataModel(
      animalName: 'Mushu', 
      animalPic: 'assets/image/mushu_reptile.jpg', 
      animalType: 'Reptiles',
      distanceAnimal: '2.5km', 
      animalBreed: 'Chinese Water Dragon', //ecllips
    ),

    AnimalDataModel(
      animalName: 'Tango', 
      animalPic: 'assets/image/tango_reptile.jpg', 
      animalType: 'Reptiles',
      distanceAnimal: '2.9km', 
      animalBreed: 'Corn Snake',
    ),

    AnimalDataModel(
      animalName: 'Bessie',
      animalPic: 'assets/image/bessie_cattle.jpg',
      animalType: 'Other',
      distanceAnimal: '1.0km',
      animalBreed: 'Holstein',
    ),

    AnimalDataModel(
      animalName: 'Shep',
      animalPic: 'assets/image/shep_sheep.jpg',
      animalType: 'Other',
      distanceAnimal: '1.5km',
      animalBreed: 'Merino',
    ),

    AnimalDataModel(
      animalName: 'Billy',
      animalPic: 'assets/image/billy_goat.jpg',
      animalType: 'Other',
      distanceAnimal: '2.0km',
      animalBreed: 'Boer',
    ),

    AnimalDataModel(
      animalName: 'Porky',
      animalPic: 'assets/image/porky_ferrets.jpg',
      animalType: 'Other',
      distanceAnimal: '2.5km',
      animalBreed: 'Ferrets',
    ),

    AnimalDataModel(
      animalName: 'Nibbles',
      animalPic: 'assets/image/nibbles_guinea_pig.jpg',
      animalType: 'Other',
      distanceAnimal: '2.8km',
      animalBreed: 'Abyssinian Guinea Pig',
    ),

    AnimalDataModel(
      animalName: 'Hammy',
      animalPic: 'assets/image/hammy_hamster.JPG',
      animalType: 'Other',
      distanceAnimal: '3.0km',
      animalBreed: 'Syrian Hamster',
    ),

    AnimalDataModel(
      animalName: 'Cutie',
      animalPic: 'assets/image/cutie_chinchillas.jpg',
      animalType: 'Other',
      distanceAnimal: '3.2km',
      animalBreed: 'Chinchillas',
    ),

  ];

}