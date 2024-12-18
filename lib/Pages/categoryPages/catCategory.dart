import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/widgets/petDisplayCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CatCategory extends StatefulWidget {
  const CatCategory({super.key});

  @override
  State<CatCategory> createState() => _CatCategoryState();
}

class _CatCategoryState extends State<CatCategory> {
  @override
  Widget build(BuildContext context) {

    //List<CatDataModel> catList = CatDataModel.catCategoryList;
    List<PetDetailDataModel> catList = PetDetailDataModel.petDetailList
                                      .where((pet) => pet.petType == 'Cats').toList();
    

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Cats'), style: heading4Bold),
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
          itemCount: catList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final cat = catList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(cat); // Check favorite status once
      
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: cat),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: cat.petImage, 
                          petName: cat.petName, 
                          petDistance: cat.distanceFromPet, 
                          petBreed: cat.petBreed, 
                          pet: cat,
                        ),
                      ),
                    );
           
          },
        ),
      ),


    );
  }
}