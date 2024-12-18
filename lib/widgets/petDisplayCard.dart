import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class PetCardDisplay extends StatelessWidget {
  final String petImage;
  final String petName;
  final String petDistance;
  final String petBreed;
  final PetDetailDataModel pet;

  const PetCardDisplay({
    super.key,
    required this.petImage,
    required this.petName,
    required this.petDistance,
    required this.petBreed,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(pet);
    
    return Container(
      width: 145.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).colorScheme.background,
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
                  petImage,
                  width: double.infinity,
                  height: 168.0,
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
                        isFavourite? IconlyBold.heart:IconlyLight.heart,                        
                        color: Colors.white, 
                      ),
                      iconSize: 35.0,
                      onPressed: () {
                        context.read<FavouriteController>().toggleAllPetFavourite(pet);
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
                Text(petName, style: bodyLSemibold),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      IconlyBold.location,
                      size: 10,
                      color: primaryOrange.shade800,
                    ),
                    const SizedBox(width: 4),
                    Text(petDistance, style: bodyXSRegular),
                    const SizedBox(width: 8),
                    Text('·', style: bodyXSRegular),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(petBreed, style: bodyXSRegular, overflow: TextOverflow.ellipsis, maxLines: 1)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}