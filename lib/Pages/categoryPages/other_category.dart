import 'package:adoptify/Pages/aboutPetPages/pet_detail_page.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/dataModel/animal_detail_data_model.dart';
import 'package:adoptify/widgets/pet_display_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OtherCategory extends StatefulWidget {
  const OtherCategory({super.key});

  @override
  State<OtherCategory> createState() => _OtherCategoryState();
}

class _OtherCategoryState extends State<OtherCategory> {
  @override
  Widget build(BuildContext context) {

    //List<OtherDataModel> otherList = OtherDataModel.otherCategoryList;
    List<PetDetailDataModel> otherList = PetDetailDataModel.petDetailList.where((pet) => pet.petType=='Other').toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Other'), style: heading4Bold),
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
          itemCount: otherList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final other = otherList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(other); // Check favorite status once

                    return GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: other),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: other.petImage, 
                          petName: other.petName, 
                          petDistance: other.distanceFromPet, 
                          petBreed: other.petBreed, 
                          pet: other,
                        ),
                      ),
                    );
           
          },
        ),
      ),


    );
  }
}