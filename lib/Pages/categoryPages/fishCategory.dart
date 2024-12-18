import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/widgets/petDisplayCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FishCategory extends StatefulWidget {
  const FishCategory({super.key});

  @override
  State<FishCategory> createState() => _FishCategoryState();
}

class _FishCategoryState extends State<FishCategory> {
  @override
  Widget build(BuildContext context) {

    //List<FishDataModel> fishList = FishDataModel.fishCategoryList;
    List<PetDetailDataModel> fishList = PetDetailDataModel.petDetailList.where((pet) => pet.petType == 'Fish').toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Fish'), style: heading4Bold),
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
          itemCount: fishList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final fish = fishList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(fish); // Check favorite status once

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: fish),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: fish.petImage, 
                          petName: fish.petName, 
                          petDistance: fish.distanceFromPet, 
                          petBreed: fish.petBreed, 
                          pet: fish,
                        ),
                      ),
                    );
           
          },
        ),
      ),


    );
  }
}