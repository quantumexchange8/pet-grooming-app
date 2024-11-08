import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/Pages/aboutPetPages/searchPage.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/animalDataModel.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  final String selectedPetType;
  const SearchResult({super.key, required this.selectedPetType});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  //String selectedField = 'All';
  String selectedPetCategory = '';

  @override
  void initState(){
    super.initState();
    selectedPetCategory = widget.selectedPetType;
  }
  
  List<AnimalDataModel> getFilteredAnimals(){
    if(selectedPetCategory == 'All'){
      return AnimalDataModel.animalAnimalegoryList;
    }else{
      return AnimalDataModel.animalAnimalegoryList.where((animal) => animal.animalType == selectedPetCategory)
        .toList();
    }
  }

  PetDetailDataModel? getPetDetailsByName(String petName){
    return PetDetailDataModel.petDetailList.firstWhere(
      (pet)=> pet.petName == petName,
      orElse:() => PetDetailDataModel(
        petName: '', 
        petImage: '', 
        petType: '', 
        distanceFromPet: '', 
        petBreed: '', 
        petOrganization: '', 
        petDescription: '', 
        petOrganizationAddress: '', 
        petOrganizationImage: '', 
        petAdoptInfo: '', 
        petAge: '', 
        petGender: '', 
        petSize: '', 
        petDescription2: '', 
        petAdoptInfo2: ''
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    List<AnimalDataModel> animalList = getFilteredAnimals();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Search Results', style: heading4Bold),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(IconlyLight.search, size: 25), 
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> SearchPage()),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            //list of button of category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10, children: [
                  petCategoryButton('assets/buttonPic/dog.png', 'Dogs', selectedPetCategory, 
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                  petCategoryButton('assets/buttonPic/cat.png', 'Cats', selectedPetCategory,  
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                  petCategoryButton('assets/buttonPic/rabbit.png', 'Rabbits', selectedPetCategory,  
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                  petCategoryButton('assets/buttonPic/bird.png', 'Birds', selectedPetCategory,  
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                  petCategoryButton('assets/buttonPic/snake.png', 'Reptiles', selectedPetCategory, 
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }), 
                  petCategoryButton('assets/buttonPic/fish.png', 'Fish', selectedPetCategory,  
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                  petCategoryButton('assets/buttonPic/monkey.png', 'Primates', selectedPetCategory,  
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                  petCategoryButton('assets/buttonPic/other.png', 'Other', selectedPetCategory,  
                    (value){
                      setState(() {
                        selectedPetCategory = value;
                      });
                    }),
                ],
              ),
            ),
          const SizedBox(height: 15),
        
          //list of animals
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75,
              ), 
              itemCount: animalList.length,
              itemBuilder: (context, index){
                final animal = animalList[index];
                final isFavourite = context.watch<FavouriteController>().isAnimalFavourite(animal);

                  return InkWell(
                    onTap: (){
                      final petDetail = getPetDetailsByName(animal.animalName);
                      if(petDetail !=null){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=> PetDetailPage(petDetails:petDetail),
                          ),
                        );
                      }else{
                        //need snackbar
                      }
                    },
                     child: Container(
                        width: 140.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Theme.of(context).colorScheme.background,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                // Pet Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    animal.animalPic,
                                    width: double.infinity,
                                    height: 170.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                     
                                // Favourite Icon Positioned in the top right
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryOrange.shade800,
                                    ),
                                    child: FittedBox(
                                      child: IconButton(
                                        icon: Icon(
                                          isFavourite? IconlyBold.heart: IconlyLight.heart,                        
                                          color: Colors.white, 
                                        ),
                                        iconSize: 35.0,
                                        onPressed: () {
                                          context.read<FavouriteController>().toggleAllAnimalFavourite(animal);
                                        },
                                      ),
                                    ),
                                  ),
                                ), 
                              ],
                            ),
                     
                            // Pet Information (Name, Location, Breed)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(animal.animalName, style: bodyLSemibold),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        IconlyBold.location,
                                        size: 10,
                                        color: primaryOrange.shade800,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(animal.distanceAnimal, style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text('·', style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(animal.animalBreed, style: bodyXSRegular,overflow: TextOverflow.ellipsis, maxLines: 1)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                   );



              }
            ),
          ),

          ],
        ),
      ),


    );
  }

  //for the category button
  Widget petCategoryButton (String url, String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(url, width: 15,height: 15),
          const SizedBox(width: 3),
          Text(label),
        ],
      ), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(
        color: selectedValue == label? Colors.white: Theme.of(context).colorScheme.primary),
      backgroundColor: Theme.of(context).colorScheme.background,
      selectedColor: primaryOrange.shade800,
      onSelected: (bool isSelected){
        setState(() {
          onSelected(isSelected? label:'');
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: grey.shade300),
      ),
    );
  }

  


}