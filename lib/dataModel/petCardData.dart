class PetCard{
  final String petName;
  final String imageUrl;
  final String distance;
  final String breed;

  PetCard({
    required this.petName,
    required this.imageUrl,
    required this.distance,
    required this.breed,
  });

  PetCard copyWith({
    String? petName,
    String? imageUrl,
    String? distance,
    String? breed,
  }){
    return PetCard(
      petName: petName?? this.petName, 
      imageUrl: imageUrl?? this.imageUrl, 
      distance: distance?? this.distance, 
      breed: breed?? this.breed,
    );
  }

  Map<String, dynamic> toJson() => {
    'petName': petName,
    'imageUrl': imageUrl,
    'distance': distance,
    'breed': breed,
  };

  factory PetCard.fromJson(Map<String, dynamic> json) => PetCard(
    petName: json['petName'], 
    imageUrl: json['imageUrl'], 
    distance: json['distance'], 
    breed: json['breed'],
  );

}

//temporary data model
List<PetCard> petCardList = [
  PetCard(
    petName: 'Mochi', 
    imageUrl: 'assets/image/mochi_cat.png', 
    distance: '1.2km', 
    breed: 'Abyssinian',
  ),

  PetCard(
    petName: 'Luna', 
    imageUrl: 'assets/image/luna_dog.jpg', 
    distance: '1.2km', 
    breed: 'Chihuahua',
  ),

  PetCard(
    petName: 'Casper', 
    imageUrl: 'assets/image/casper_cat.png', 
    distance: '1.2km', 
    breed: 'Manx',
  ),

  PetCard(
    petName: 'Willow', 
    imageUrl: 'assets/image/willow_cat.png', 
    distance: '1.5km', 
    breed: 'Manx',
  ),


];