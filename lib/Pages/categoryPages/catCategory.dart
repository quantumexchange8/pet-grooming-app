import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/catDataModel.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class CatCategory extends StatefulWidget {
  const CatCategory({super.key});

  @override
  State<CatCategory> createState() => _CatCategoryState();
}

class _CatCategoryState extends State<CatCategory> {
  @override
  Widget build(BuildContext context) {

    List<CatDataModel> catList = CatDataModel.catCategoryList;
    

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Cats', style: heading4Bold),
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
        padding: const EdgeInsets.all(10.0),
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
            final isFavourite = context.watch<FavouriteController>().isCatFavourite(cat); // Check favorite status once

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
                                    cat.catPic,
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
                                          isFavourite?  IconlyBold.heart: IconlyLight.heart,                        
                                          color: Colors.white, 
                                        ),
                                        iconSize: 35.0,
                                        onPressed: () {
                                          context.read<FavouriteController>().toggleCatFavourite(cat);
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
                                  Text(cat.catName, style: bodyLSemibold),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        IconlyBold.location,
                                        size: 10,
                                        color: primaryOrange.shade800,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(cat.distanceCat, style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text('·', style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(cat.catBreed, style: bodyXSRegular,overflow: TextOverflow.ellipsis, maxLines: 1)
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