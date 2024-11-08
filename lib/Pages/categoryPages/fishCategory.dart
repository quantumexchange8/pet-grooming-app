import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/fishDataModel.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class FishCategory extends StatefulWidget {
  const FishCategory({super.key});

  @override
  State<FishCategory> createState() => _FishCategoryState();
}

class _FishCategoryState extends State<FishCategory> {
  @override
  Widget build(BuildContext context) {

    List<FishDataModel> fishList = FishDataModel.fishCategoryList;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Fish', style: heading4Bold),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(IconlyLight.search),
              onPressed: (){},
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: fishList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final fish = fishList[index];
            final isFavourite = context.watch<FavouriteController>().isFishFavourite(fish); // Check favorite status once

                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        width: 140.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
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
                                    fish.fishPic,
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
                                          context.read<FavouriteController>().toggleFishFavourite(fish);
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
                                  Text(fish.fishName, style: bodyLSemibold),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        IconlyBold.location,
                                        size: 10,
                                        color: primaryOrange.shade800,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(fish.distanceFish, style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text('·', style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(fish.fishBreed, style: bodyXSRegular,overflow: TextOverflow.ellipsis, maxLines: 1)
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
           
          },
        ),
      ),


    );
  }
}