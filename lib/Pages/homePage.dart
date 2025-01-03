import 'package:adoptify/Pages/aboutPetPages/searchPage.dart';
import 'package:adoptify/Pages/categoryPages/birdCategory.dart';
import 'package:adoptify/Pages/categoryPages/catCategory.dart';
import 'package:adoptify/Pages/categoryPages/dogCategory.dart';
import 'package:adoptify/Pages/categoryPages/fishCategory.dart';
import 'package:adoptify/Pages/categoryPages/otherCategory.dart';
import 'package:adoptify/Pages/categoryPages/primateCategory.dart';
import 'package:adoptify/Pages/categoryPages/rabbitCategory.dart';
import 'package:adoptify/Pages/categoryPages/reptilesCategory.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/petCardData.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Adoptify', style: heading4Bold),
        centerTitle: true,
        leading: Image.asset('assets/logo/paw_small.png'),
        actions: <Widget>[
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: grey.shade300),
            ),
            child: FittedBox(
              child: IconButton(
                icon: const Icon(IconlyLight.search, size: 30), 
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=> const SearchPage()),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: grey.shade300),
            ),
            child: FittedBox(
              child: IconButton(
                icon: const Icon(IconlyLight.notification, size: 30), 
                onPressed: (){
                  
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),


      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //the main picture in the homepage // retrieve the orange background
              //Image.asset('assets/image/homepage_pic.png'),
              Container(
                width: double.infinity,
                //height: 200,
                child: Stack(
                  children: [
                    Image.asset('assets/image/orange_homepage_bg.png', fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(context.tr('Just About to Adopt?'), style: heading4Bold.copyWith(color: Colors.white)),
                                const SizedBox(height: 5),
                                Text(context.tr('See how you can find friends who are a match for you'), style: bodySRegular.copyWith(color: Colors.white),),
                            
                              ],
                            ),
                          ),
                      
                          Flexible(
                            flex: 4,
                            child: Image.asset('assets/image/homepage_dog.png', /* fit: BoxFit.contain */),
                          ),
                      
                      
                        ],
                      ),
                    ),

                    

                   
                  ],
                ),
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _animalCategories('assets/buttonPic/dog.png', 'animals.dogs',(){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DogCategory()));
                  }),
                  _animalCategories('assets/buttonPic/cat.png', 'animals.cats', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const CatCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/rabbit.png', 'animals.rabbits', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RabbitCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/bird.png', 'animals.birds', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const BirdCategory(),));
                  }),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _animalCategories('assets/buttonPic/snake.png', 'animals.reptiles', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReptileCategory(),));
                  }),
                  _animalCategories('assets/buttonPic/fish.png', 'animals.fish', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const FishCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/monkey.png', 'animals.primates', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const PrimateCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/other.png', 'animals.other', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtherCategory(),));
                  }),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 6,
                    child: Text(context.tr('Pets Near You'), style: heading5Bold, overflow: TextOverflow.ellipsis, maxLines: 1)
                  ),
                  Flexible(
                    flex: 4,
                    child: TextButton(
                      onPressed: (){}, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(context.tr('View All'), style: bodyLBold.copyWith(color: primaryOrange.shade800)),
                          const SizedBox(width: 10),
                          Icon(IconlyLight.arrow_right, color: primaryOrange.shade800),
                        ],
                      ),
                      
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              //add horizontal scroll pet card
              SizedBox(
                height: 210.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: petCardList.length,
                  itemBuilder: (context, index) {
                    final pet = petCardList[index];
                    final isFavourite = context.watch<FavouriteController>().isPetFavourite(pet); // Check favorite status once

                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        width: 140.0,
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
                                    pet.imageUrl,
                                    width: double.infinity,
                                    height: 140.0,
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
                                          context.read<FavouriteController>().togglePetFavourite(pet);
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
                                  Text(pet.petName, style: bodyLSemibold),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        IconlyBold.location,
                                        size: 10,
                                        color: primaryOrange.shade800,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(pet.distance, style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text('.', style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text(pet.breed, style: bodyXSRegular),
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


              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 6,
                    child: Text(context.tr('Based on Your Preferences'), style: heading5Bold, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ),
                  //const SizedBox(width: 15),
                  Flexible(
                    flex: 4,
                    child: TextButton(
                      onPressed: (){}, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(context.tr('View All'), style: bodyLBold.copyWith(color: primaryOrange.shade800)),
                          const SizedBox(width: 10),
                          Icon(IconlyLight.arrow_right, color: primaryOrange.shade800),
                        ],
                      ),
                      
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              SizedBox(
                height: 210.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: petCardList.length,
                  itemBuilder: (context, index) {
                    final pet = petCardList[index];
                    final isFavourite = context.watch<FavouriteController>().isPetFavourite(pet); // Check favorite status once

                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        width: 140.0,
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
                                    pet.imageUrl,
                                    width: double.infinity,
                                    height: 140.0,
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
                                          context.read<FavouriteController>().togglePetFavourite(pet);
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
                                  Text(pet.petName, style: bodyLSemibold),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        IconlyBold.location,
                                        size: 10,
                                        color: primaryOrange.shade800,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(pet.distance, style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text('·', style: bodyXSRegular),
                                      const SizedBox(width: 8),
                                      Text(pet.breed, style: bodyXSRegular),
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



            ],
          ),
        ),
      ),
    );
  }

  Widget _animalCategories(String image, String animal, VoidCallback onPress){
    return Column(
      children: [
        OutlinedButton(
          onPressed: onPress,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const CircleBorder(),
            ),
            fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(60)),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: grey.shade600),
            ),
          ),
          child: Image.asset(image, width: 30, height: 30),
        ),
        const SizedBox(height: 8),
        Text(context.tr(animal), style: bodyLMedium),
      ],
    );
  }


}