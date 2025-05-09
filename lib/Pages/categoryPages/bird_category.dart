import 'package:adoptify/Pages/aboutPetPages/pet_detail_page.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/dataModel/animal_detail_data_model.dart';
import 'package:adoptify/widgets/pet_display_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BirdCategory extends StatefulWidget {
  const BirdCategory({super.key});

  @override
  State<BirdCategory> createState() => _BirdCategoryState();
}

class _BirdCategoryState extends State<BirdCategory> {
  @override
  Widget build(BuildContext context) {

    //List<BirdDataModel> birdList = BirdDataModel.birdCategoryList;
    List<PetDetailDataModel> birdList = PetDetailDataModel.petDetailList
                                        .where((pet) => pet.petType == 'Birds').toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Birds'), style: heading4Bold),
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
          itemCount: birdList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final bird = birdList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(bird); // Check favorite status once
            //final isFavourite = false;

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: bird),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: bird.petImage, 
                          petName: bird.petName, 
                          petDistance: bird.distanceFromPet, 
                          petBreed: bird.petBreed, 
                          pet: bird,
                        ),
                      ),
                      
                    );
           
          },
        ),
      ),


    );
  }
}