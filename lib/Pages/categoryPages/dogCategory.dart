import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/widgets/petDisplayCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DogCategory extends StatefulWidget {
  const DogCategory({super.key});

  @override
  State<DogCategory> createState() => _DogCategoryState();
}

class _DogCategoryState extends State<DogCategory> {
  @override
  Widget build(BuildContext context) {
   // List<DogDataModel> dogList = DogDataModel.dogCategoryList;
   List<PetDetailDataModel> dogList = PetDetailDataModel.petDetailList
          .where((pet) => pet.petType == 'Dogs').toList();

    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Dogs'), style: heading4Bold),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(IconlyLight.search),
              onPressed: (){},
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0),
        child: GridView.builder(
          itemCount: dogList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final dog = dogList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(dog); // Check favorite status once

            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => PetDetailPage(petDetails: dog),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: PetCardDisplay(
                  petImage: dog.petImage, 
                  petName: dog.petName, 
                  petDistance: dog.distanceFromPet, 
                  petBreed: dog.petBreed, 
                  pet: dog,
                ),
                
              ),
            );
           
          },
          
        ),
      ),


    );
  }
}