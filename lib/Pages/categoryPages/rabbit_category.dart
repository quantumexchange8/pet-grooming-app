import 'package:adoptify/Pages/aboutPetPages/pet_detail_page.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/dataModel/animal_detail_data_model.dart';
import 'package:adoptify/widgets/pet_display_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RabbitCategory extends StatefulWidget {
  const RabbitCategory({super.key});

  @override
  State<RabbitCategory> createState() => _RabbitCategoryState();
}

class _RabbitCategoryState extends State<RabbitCategory> {
  @override
  Widget build(BuildContext context) {

    //List<RabbitDataModel>rabbitList = RabbitDataModel.rabbitcategoryList;
    List<PetDetailDataModel> rabbitList = PetDetailDataModel.petDetailList.where((pet) => pet.petType == 'Rabbits').toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Rabbits'), style: heading4Bold),
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
          itemCount: rabbitList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final rabbit = rabbitList[index];
            //final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(rabbit); // Check favorite status once

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PetDetailPage(petDetails: rabbit),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: PetCardDisplay(
                          petImage: rabbit.petImage, 
                          petName: rabbit.petName, 
                          petDistance: rabbit.distanceFromPet, 
                          petBreed: rabbit.petBreed, 
                          pet: rabbit,
                        ),
                      ),
                    );
           
          },
        ),
      ),


    );
  }
}