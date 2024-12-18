import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/widgets/petDisplayCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ReptileCategory extends StatefulWidget {
  const ReptileCategory({super.key});

  @override
  State<ReptileCategory> createState() => _ReptileCategoryState();
}

class _ReptileCategoryState extends State<ReptileCategory> {
  @override
  Widget build(BuildContext context) {

    //List<ReptileDataModel> reptileList = ReptileDataModel.reptileCategoryList;
    List<PetDetailDataModel> reptileList = PetDetailDataModel.petDetailList.where((pet) => pet.petType == 'Reptiles').toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Reptiles'), style: heading4Bold),
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
          itemCount: reptileList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final reptile = reptileList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(reptile); // Check favorite status once

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: reptile),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: reptile.petImage, 
                          petName: reptile.petName, 
                          petDistance: reptile.distanceFromPet, 
                          petBreed: reptile.petBreed, 
                          pet: reptile,
                        ),
                      ),
                    );
           
          },
        ),
      ),


    );
  }
}