class PetOrganizationLocationData{
  final String petOrganizationName;
  final String address;
  final double latitude;
  final double longtitude;
  final String? imageUrlOnMap;

  PetOrganizationLocationData({
    required this.petOrganizationName,
    required this.address,
    required this.latitude,
    required this.longtitude,
    this.imageUrlOnMap,
  });

  Map<String, dynamic> toJson()=> {
    'petOrganizationName': petOrganizationName,
    'address': address,
    'latitude': latitude,
    'longtitude': longtitude,
    'imageUrlOnMap': imageUrlOnMap,
  };

  factory PetOrganizationLocationData.fromJson(Map<String, dynamic>json) => PetOrganizationLocationData(
    petOrganizationName: json['petOrganizationName'], 
    address: json['address'], 
    latitude: json['latitude'], 
    longtitude: json['longtitude'], 
    imageUrlOnMap: json['imageUrlOnMap'],
  );

}

//temporary data
List<PetOrganizationLocationData> locationPinData = [
  PetOrganizationLocationData(
    petOrganizationName: 'Happy Tails Animal Rescue', 
    address: '123 Paws Street, NYC, NY 10001', 
    latitude: 3.140953,
    longtitude: 101.693507, 
    imageUrlOnMap: 'assets/image/mochi_cat.png',
  ),

  PetOrganizationLocationData(
    petOrganizationName: 'Feline Friends Rescue', 
    address: '753 Andrea Street, Ohio, OH 43029', 
    latitude: 3.098953,
    longtitude: 101.699507, 
    imageUrlOnMap: 'assets/image/milo_cat.jpg',
  ),

  PetOrganizationLocationData(
    petOrganizationName: 'FurEver Friends', 
    address: '789 Persian Alley, Orlando, FL 32801', 
    latitude: 3.094953,
    longtitude: 101.700507, 
    imageUrlOnMap: 'assets/image/oliver_cat.jpg',
  ),

  PetOrganizationLocationData(
    petOrganizationName: 'Gentle Paws', 
    address: '555 Peaceful Way, Boston, MA 02101', 
    latitude: 3.144940,
    longtitude: 101.400111, 
    imageUrlOnMap: 'assets/image/rusty_dog.png',
  ),

  PetOrganizationLocationData(
    petOrganizationName: 'Whiskers & Paws Shelter', 
    address: '222 Kitty Lane, Seattle, WA 98101', 
    latitude: 3.135953,
    longtitude: 101.599507, 
    imageUrlOnMap: 'assets/image/shadow_cat.jpg',
  ),

  PetOrganizationLocationData(
    petOrganizationName: 'Paws & Love Shelter', 
    address: '456 Lane, Austin, TX 78701', 
    latitude: 3.14099,
    longtitude: 101.699519, 
    imageUrlOnMap: 'assets/image/willow_cat.png',
  ),




];

