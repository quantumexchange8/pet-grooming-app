import 'package:adoptify/Pages/aboutPetPages/pet_detail_page.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/dataModel/animal_detail_data_model.dart';
import 'package:adoptify/widgets/pet_display_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PrimateCategory extends StatefulWidget {
  const PrimateCategory({super.key});

  @override
  State<PrimateCategory> createState() => _PrimateCategoryState();
}

class _PrimateCategoryState extends State<PrimateCategory> {
  @override
  Widget build(BuildContext context) {

    //List<PrimateDataModel> primateList = PrimateDataModel.primateCategoryList;
    List<PetDetailDataModel> primateList = PetDetailDataModel.petDetailList.where((pet) => pet.petType == 'Primates').toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Primates'), style: heading4Bold),
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
          itemCount: primateList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final primate = primateList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(primate); // Check favorite status once

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: primate),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: primate.petImage, 
                          petName: primate.petName, 
                          petDistance: primate.distanceFromPet, 
                          petBreed: primate.petBreed, 
                          pet: primate
                        ),
                      ),
                    );
           
          },
        ),
      ),


    );
  }
}