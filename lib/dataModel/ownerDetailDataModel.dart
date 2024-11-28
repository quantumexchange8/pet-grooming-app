import 'package:adoptify/dataModel/animalDetailDataModel.dart';

class OwnerDetailDataModel{
  final String ownerName;
  final String ownerPlaceAddress;
  final String ownerPhoneNo;
  final String ownerEmail;
  final String ownerWebsite;
  List<PetDetailDataModel> petListBasedOnOwner;
  final String ownerIntro;
  final String adoptionApplication;
  final String policy2;
  final String policy3;
  final String adoptionFee;


  OwnerDetailDataModel({
    required this.ownerName,
    required this.ownerPlaceAddress,
    required this.ownerPhoneNo,
    required this.ownerEmail,
    required this.ownerWebsite,
    required this.petListBasedOnOwner,
    required this.ownerIntro,
    required this.adoptionApplication,
    required this.policy2,
    required this.policy3,
    required this.adoptionFee,
  });

  OwnerDetailDataModel copyWith({
    String? ownerName,
    String? ownerPlaceAddress,
    String? ownerPhoneNo,
    String? ownerEmail,
    String? ownerWebsite,
    List<PetDetailDataModel>? petListBasedOnOwner,
    String? ownerIntro,
    String? adoptionApplication,
    String? policy2,
    String? policy3,
    String? adoptionFee,
  }){
    return OwnerDetailDataModel(
      ownerName: ownerName?? this.ownerName, 
      ownerPlaceAddress: ownerPlaceAddress?? this.ownerPlaceAddress, 
      ownerPhoneNo: ownerPhoneNo?? this.ownerPhoneNo, 
      ownerEmail: ownerEmail?? this.ownerEmail, 
      ownerWebsite: ownerWebsite?? this.ownerWebsite, 
      petListBasedOnOwner: petListBasedOnOwner?? this.petListBasedOnOwner, 
      ownerIntro: ownerIntro?? this.ownerIntro, 
      adoptionApplication: adoptionApplication?? this.adoptionApplication, 
      policy2: policy2?? this.policy2, 
      policy3: policy3?? this.policy3, 
      adoptionFee: adoptionFee?? this.adoptionFee,
    );
  }

  Map<String, dynamic> toJson() => {
    'ownerName': ownerName,
    'ownerPlaceAddress': ownerPlaceAddress,
    'ownerPhoneNo': ownerPhoneNo,
    'ownerEmail': ownerEmail,
    'ownerWebsite': ownerWebsite,
    'petListBasedOnOwner': petListBasedOnOwner.map((ownerPet) => ownerPet.toJson()).toList(),
    'ownerIntro': ownerIntro,
    'adoptionApplication': adoptionApplication,
    'policy2': policy2,
    'policy3': policy3,
    'adoptionFee': adoptionFee,
  };

  factory OwnerDetailDataModel.fromJson(Map<String,dynamic>json)=>OwnerDetailDataModel(
    ownerName: json['ownerName'], 
    ownerPlaceAddress:json['ownerPlaceAddress'], 
    ownerPhoneNo: json['ownerPhoneNo'], 
    ownerEmail: json['ownerEmail'], 
    ownerWebsite: json['ownerWebsite'], 
    petListBasedOnOwner: (json['petListBasedOnOwner'] as List).map((ownerPetJson) => PetDetailDataModel.fromJson(ownerPetJson)).toList(), 
    ownerIntro: json['ownerIntro'], 
    adoptionApplication: json['adoptionApplication'], 
    policy2: json['policy2'], 
    policy3: json['policy3'], 
    adoptionFee: json['adoptionFee'],
  );

}

// petOrganization in PetDetailDataMOdel = ownerName in ownerDetailDataModel
void displayPetsUnderOwner(OwnerDetailDataModel owner){
  List<PetDetailDataModel> pets = PetDetailDataModel.getPetsByOwner(owner.ownerName);
}

//temporary data model
List<OwnerDetailDataModel> ownerDetailList = [
  OwnerDetailDataModel(
    ownerName: 'Happy Tails Animal Rescue', 
    ownerPlaceAddress: '123 Paws Street, NYC, NY 10001', 
    ownerPhoneNo: '(555) 123-4567', 
    ownerEmail: 'animalrescue@happytails.org', 
    ownerWebsite: 'www.happytailsanimalrescue.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Happy Tails Animal Rescue'), 
    ownerIntro: 'At Happy Tails Animal Rescue, our primary goal is to ensure the well-being and happiness of every pet in our care. Our adoption process is designed to match each animal with a loving and responsible forever home. Please review our adoption policy below:', 
    adoptionApplication: 'Interested adopters are required to complete an adoption application. This helps us understand your lifestyle, preferences, and expectations, ensuring a suitable match.', 
    policy2: 'Once your application is reviewed, we\'ll arrange a meet-and-greet with the pet of interest. This allows you to interact with the pet and access compatibility.', 
    policy3: 'A home visit may be conducted to ensure a safe and suitable environment for the pet. This step helps us address any specific needs or concerns.', 
    adoptionFee: 'An adoption fee is applicable and contributes to the cost of vaccinations, spaying/neutering, microchipping, and overall care. Fee amounts vary based on the pet\'s age and medical history.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Feline Friends Rescue', 
    ownerPlaceAddress: '753 Andrea Street, Ohio, OH 43029', 
    ownerPhoneNo: '(555) 654-3210', 
    ownerEmail: 'contact@felinefriends.org', 
    ownerWebsite: 'www.felinefriendsrescue.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Feline Friends Rescue'), 
    ownerIntro: 'Feline Friends Rescue is dedicated to helping stray animals find a loving and safe home. Our dedicated team ensures that each animals\' unique needs are met and that they are matched with the perfect forever family.', 
    adoptionApplication: 'Prospective adopters are required to fill out an adoption application, which helps us assess compatibility and ensure a positive adoption experience.', 
    policy2: 'After your application review, a meet-and-greet session will be arranged to introduce you to the animals and allow you both to bond.', 
    policy3: 'A home visit might be scheduled to confirm that the home is safe and suitable for the pets, allowing us to address any necessary adjustments.', 
    adoptionFee: 'The adoption fee covers basic medical care, spaying/neutering, vaccinations, and microchipping. Fees may vary depending on the animals\' age and health requirements.',
  ),

  OwnerDetailDataModel(
    ownerName: 'FurEver Friends', 
    ownerPlaceAddress: '789 Persian Alley, Orlando, FL 32801', 
    ownerPhoneNo: '(555) 101-2020', 
    ownerEmail: 'info@fureverfriends.org', 
    ownerWebsite: 'www.fureverfriendsrescue.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('FurEver Friends'), 
    ownerIntro: 'FurEver Friends is committed to helping animals find their forever homes through a thoughtful and thorough adoption process.', 
    adoptionApplication: 'Adopters must complete an adoption application to help us understand their preferences and lifestyle.', 
    policy2: 'If the application is approved, we\'ll arrange a time for you to meet the animal and interact with them before making a decision.', 
    policy3: 'We may conduct a home visit to ensure the pet\'s safety and well-being in the new environment.', 
    adoptionFee: 'An adoption fee helps cover essential veterinary care, including vaccinations and microchipping.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Gentle Paws', 
    ownerPlaceAddress: '555 Peaceful Way, Boston, MA 02101', 
    ownerPhoneNo: '(555) 888-9999', 
    ownerEmail: 'hello@gentlepaws.org', 
    ownerWebsite: 'www.gentlepaws.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Gentle Paws'), 
    ownerIntro: 'Gentle Paws is focused on helping rescue animals transition into loving homes. We believe in matching each pet with a responsible, caring family.', 
    adoptionApplication: 'All adopters are required to fill out an application to assist us in finding the best match for both the pet and the adopter.', 
    policy2: 'Following the application review, we set up a meeting to allow potential adopters to interact with the pet.', 
    policy3: 'A home visit may be conducted as part of the adoption process to ensure a suitable environment for the pet.', 
    adoptionFee: 'An adoption fee is charged to cover essential care, including vaccinations, spaying/neutering, and microchipping.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Whiskers & Paws Shelter', 
    ownerPlaceAddress: '222 Kitty Lane, Seattle, WA 98101', 
    ownerPhoneNo: '(555) 777-1212', 
    ownerEmail: 'contact@whiskerspaws.org', 
    ownerWebsite: 'www.whiskerspawsshelter.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Whiskers & Paws Shelter'), 
    ownerIntro: 'At Whiskers & Paws Shelter, we provide rescue and rehoming services for stray animals, working to place each animal in a loving home.', 
    adoptionApplication: 'Interested adopters need to complete an adoption application, helping us find a suitable match for the pet and the new family.', 
    policy2: 'If approved, a meet-and-greet is scheduled to provide an opportunity for bonding with the pet.', 
    policy3: 'A home check may be performed to ensure a safe and comfortable environment for the pet.', 
    adoptionFee: 'Our adoption fee covers the costs of necessary medical services, including vaccinations and microchipping.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Paws & Love Shelter', 
    ownerPlaceAddress: '456 Lane, Austin, TX 78701', 
    ownerPhoneNo: '(555) 654-3210', 
    ownerEmail: 'support@pawsandlove.org', 
    ownerWebsite: 'www.pawsandlove.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Paws & Love Shelter'), 
    ownerIntro: 'Paws & Love Shelter is dedicated to providing second chances to pets in need. We work closely with adopters to ensure a lasting bond.', 
    adoptionApplication: 'Our adoption application process is designed to assess each potential adopter\'s commitment and environment for a successful match.', 
    policy2: 'Once reviewed, we arrange an introductory visit to help both the pet and adopter feel comfortable with each other.', 
    policy3: 'A post-adoption follow-up is part of our commitment to ensure both pet and adopter are adjusting well.', 
    adoptionFee: 'An adoption fee applies to cover vaccinations, spaying/neutering, and other essential medical needs.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Bunny Love Rescue', 
    ownerPlaceAddress: '654 Bunny Blvd, Portland, OR 97201', 
    ownerPhoneNo: '(555) 333-4444', 
    ownerEmail: 'adopt@bunnyloverescue.org', 
    ownerWebsite: 'www.bunnyloverescue.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Bunny Love Rescue'), 
    ownerIntro: 'Bunny Love Rescue specializes in the care and adoption of rabbits, providing a safe space until they find their forever homes.', 
    adoptionApplication: 'We require all potential adopters to complete an application to ensure they are prepared for the unique needs of rabbits.', 
    policy2: 'A meet-and-greet session allows us to introduce you to our bunnies and ensure compatibility.', 
    policy3: 'After adoption, we provide guidance on rabbit care to ensure a smooth transition into your home.', 
    adoptionFee: 'The adoption fee supports the cost of veterinary care, including vaccinations and any necessary treatments.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Wings of Love Rescue', 
    ownerPlaceAddress: '123 Feather Lane, Miami, FL 33101', 
    ownerPhoneNo: '(555) 222-3333', 
    ownerEmail: 'info@wingsoflove.org', 
    ownerWebsite: 'www.wingsoflove.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Wings of Love Rescue'), 
    ownerIntro: 'Wings of Love Rescue helps find homes for birds of all kinds, prioritizing each bird\'s specific dietary, environmental, and social needs.', 
    adoptionApplication: 'All adopters must complete an application, helping us to determine their knowledge and experience with bird care.', 
    policy2: 'A visit to meet the bird is scheduled to allow bonding time and to answer any care-related questions.', 
    policy3: 'We offer a trial adoption period to ensure both adopter and bird are comfortable in their new arrangement.', 
    adoptionFee: 'Adoption fees cover care essentials, including avian vet services, dietary needs, and behavioral assessments.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Reptile Haven Rescue', 
    ownerPlaceAddress: '123 Scale Street, Phoenix, AZ 85001', 
    ownerPhoneNo: '(555) 123-4567', 
    ownerEmail: 'contact@reptilehaven.org', 
    ownerWebsite: 'www.reptilehaven.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Reptile Haven Rescue'), 
    ownerIntro: 'Reptile Haven Rescue focuses on the unique needs of reptiles, ensuring they are matched with adopters who understand and appreciate them.', 
    adoptionApplication: 'An application process helps us identify adopters who are aware of the environmental, dietary, and health requirements for reptiles.', 
    policy2: 'We conduct a detailed discussion about the care requirements during a meet-and-greet session with the reptile.', 
    policy3: 'A home visit may be necessary to verify that the setup meets the reptile\'s specific needs.', 
    adoptionFee: 'The adoption fee assists with ongoing care, dietary needs, and any special equipment required for the pet\'s well-being.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Scales Sanctuary', 
    ownerPlaceAddress: '456 Reptile Road, Denver, CO 80201', 
    ownerPhoneNo: '(555) 234-5678', 
    ownerEmail: 'hello@scalessanctuary.org', 
    ownerWebsite: 'www.scalessanctuary.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Scales Sanctuary'), 
    ownerIntro: 'At Scales Sanctuary, we advocate for responsible reptile ownership and work diligently to match each pet with knowledgeable adopters.', 
    adoptionApplication: 'Our application ensures adopters are prepared for the unique responsibilities of reptile care, including proper habitat and diet.', 
    policy2: 'During the meet-and-greet, we discuss the pet\'s specific care instructions, equipment, and diet requirements.', 
    policy3: 'A post-adoption follow-up is conducted to support the new owner in providing a safe and comfortable environment.', 
    adoptionFee: 'Adoption fees go towards the cost of specialized care and any habitat adjustments the pet may need.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Fin Friends Rescue', 
    ownerPlaceAddress: '123 Aqua Ave, Seattle, WA 98101', 
    ownerPhoneNo: '(555) 111-2222', 
    ownerEmail: 'support@finfriends.org', 
    ownerWebsite: 'www.finfriendsrescue.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Fin Friends Rescue'), 
    ownerIntro: 'Fin Friends Rescue provides shelter and rehoming services for fish and other aquatic pets, focusing on their unique habitat needs.', 
    adoptionApplication: 'We require an adoption application to ensure adopters have a suitable setup and knowledge of aquatic pet care.', 
    policy2: 'An orientation on proper tank setup, maintenance, and species compatibility is provided during the adoption process.', 
    policy3: 'A follow-up check helps ensure the pet\'s transition is smooth and that the tank environment remains suitable.', 
    adoptionFee: 'The fee supports the upkeep of our facilities, water quality management, and basic veterinary care for aquatic pets.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Freshwater Friends Rescue', 
    ownerPlaceAddress: '321 Waterway, Austin, TX 78701', 
    ownerPhoneNo: '(555) 777-8888', 
    ownerEmail: 'support@freshwaterfriends.org', 
    ownerWebsite: 'www.freshwaterfriends.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Freshwater Friends Rescue'), 
    ownerIntro: 'Freshwater Friends Rescue is devoted to the well-being of freshwater fish, helping adopters provide suitable aquatic environments.', 
    adoptionApplication: 'We require a detailed application to ensure adopters have the necessary tank setup, knowledge, and equipment for fish care.', 
    policy2: 'An orientation is provided during adoption to cover essentials like tank maintenance, water quality, and compatible tankmates.', 
    policy3: 'A post-adoption check is available to answer any questions about care and to ensure the fish\'s environment is stable.', 
    adoptionFee: 'Adoption fees go toward maintaining our facilities, water quality monitoring, and covering medical care for rescued fish.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Primate Haven Rescue', 
    ownerPlaceAddress: '123 Jungle Drive, Orlando, FL 32801', 
    ownerPhoneNo: '(555) 111-2222', 
    ownerEmail: 'contact@primatehaven.org', 
    ownerWebsite: 'www.primatehaven.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Primate Haven Rescue'), 
    ownerIntro: 'Primate Haven Rescue is dedicated to rescuing and rehoming primates, with a strong focus on ethical care and responsible placement.', 
    adoptionApplication: 'Our application helps us ensure that adopters are fully prepared for the complex needs of primates.', 
    policy2: 'A pre-adoption session is required to discuss the specifics of primate care, social needs, and dietary requirements.', 
    policy3: 'Home visits and ongoing support are part of our commitment to both the primate and adopter\'s well-being.', 
    adoptionFee: 'Fees contribute to the primate\'s health care, enrichment needs, and specialized dietary requirements.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Exotic Animal Sanctuary', 
    ownerPlaceAddress: '678 Wildlife Avenue, Denver, CO 80201', 
    ownerPhoneNo: '(555) 111-3333', 
    ownerEmail: 'info@exoticanimals.org', 
    ownerWebsite: 'www.exoticanimalsanctuary.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Exotic Animal Sanctuary'), 
    ownerIntro: 'Exotic Animal Sanctuary is committed to the ethical care and rehoming of exotic animals, prioritizing adopter education and awareness.', 
    adoptionApplication: 'Our application process ensures adopters are prepared for the specific requirements of exotic animals.', 
    policy2: 'We offer an orientation session where adopters can learn about proper care practices and enrichment techniques.', 
    policy3: 'A home visit may be required to verify the environment is suitable and safe for the exotic pet.', 
    adoptionFee: 'Fees help cover specialized veterinary care, dietary needs, and habitat enrichment.',
  ),

  OwnerDetailDataModel(
    ownerName: 'Shepherd\'s Heart Farm', 
    ownerPlaceAddress: '123 Shepherd Road, Albany, NY 12201', 
    ownerPhoneNo: '(555) 303-4040', 
    ownerEmail: 'info@shepherdsheartfarm.org', 
    ownerWebsite: 'www.shepherdsheartfarm.org', 
    petListBasedOnOwner: PetDetailDataModel.getPetsByOwner('Shepherd\'s Heart Farm'), 
    ownerIntro: 'Shepherd\'s Heart Farm provides a peaceful refuge for farm animals, with a mission to connect animals in need with caring, responsible homes.', 
    adoptionApplication: 'Potential adopters must complete an application to help us ensure a safe and prepared environment for each farm animal.', 
    policy2: 'A visit to our farm allows adopters to interact with animals, learn about their needs, and assess compatibility.', 
    policy3: 'We conduct a site visit to ensure the adopter\'s space is safe, well-equipped, and suitable for farm animal care.', 
    adoptionFee: 'Adoption fees help cover the cost of vaccinations, nutritional needs, and veterinary services for farm animals.',
  ),

];

/* for(var owner in ownerDetailsList){
  owner.filterPetsByOwner(allPets);
} */