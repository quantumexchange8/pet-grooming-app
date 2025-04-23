import 'package:adoptify/Pages/aboutPetPages/pet_detail_page.dart';
import 'package:adoptify/Pages/aboutPetPages/search_page.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/dataModel/animal_detail_data_model.dart';
import 'package:adoptify/widgets/pet_display_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchResult extends StatefulWidget {
  final String selectedPetType;
  const SearchResult({super.key, required this.selectedPetType});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  
  String selectedPetCategory = '';

  @override
  void initState(){
    super.initState();
    selectedPetCategory = widget.selectedPetType;
  }

  List<PetDetailDataModel> getFilteredAnimals(){
    if(selectedPetCategory == 'All'){
      return PetDetailDataModel.petDetailList;
    }else{
      return PetDetailDataModel.petDetailList.where((pet) => pet.petType == selectedPetCategory).toList();
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
    
    List<PetDetailDataModel> animalList = getFilteredAnimals();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Search Results'), style: heading4Bold),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.search, size: 25), 
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=> const SearchPage()),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75,
              ), 
              itemCount: animalList.length,
              itemBuilder: (context, index){
                final animal = animalList[index];
                //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(animal);

                  return InkWell(
                    onTap: (){
                      final petDetail = getPetDetailsByName(animal.petName);
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
                     child: PetCardDisplay(
                      petImage: animal.petImage, 
                      petName: animal.petName, 
                      petDistance: animal.distanceFromPet, 
                      petBreed: animal.petBreed, 
                      pet: animal,
                      )
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
          Text(context.tr(label)),
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
        side: BorderSide(color: grey.shade600),
      ),
    );
  }

  


}