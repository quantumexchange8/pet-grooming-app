import 'package:adoptify/categoryPages/birdCategory.dart';
import 'package:adoptify/categoryPages/catCategory.dart';
import 'package:adoptify/categoryPages/dogCategory.dart';
import 'package:adoptify/categoryPages/fishCategory.dart';
import 'package:adoptify/categoryPages/otherCategory.dart';
import 'package:adoptify/categoryPages/primateCategory.dart';
import 'package:adoptify/categoryPages/rabbitCategory.dart';
import 'package:adoptify/categoryPages/reptilesCategory.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/petCardData.dart';
import 'package:flutter/material.dart';
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
                icon: Icon(IconlyLight.search, size: 30), 
                onPressed: (){
              
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
                icon: Icon(IconlyLight.notification, size: 30), 
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
              Image.asset('assets/image/homepage_pic.png'),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _animalCategories('assets/buttonPic/dog.png', 'Dogs',(){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DogCategory()));
                  }),
                  _animalCategories('assets/buttonPic/cat.png', 'Cats', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CatCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/rabbit.png', 'Rabbits', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RabbitCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/bird.png', 'Birds', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BirdCategory(),));
                  }),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _animalCategories('assets/buttonPic/snake.png', 'Reptiles', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ReptileCategory(),));
                  }),
                  _animalCategories('assets/buttonPic/fish.png', 'Fish', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FishCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/monkey.png', 'Primates', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PrimateCategory(),));
                  }),                
                  _animalCategories('assets/buttonPic/other.png', 'Other', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OtherCategory(),));
                  }),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pets Near You', style: heading5Bold),
                  TextButton(
                    onPressed: (){}, 
                    child: Row(
                      children: [
                        Text('View All', style: bodyLBold.copyWith(color: primaryOrange.shade800)),
                        const SizedBox(width: 10),
                        Icon(IconlyLight.arrow_right, color: primaryOrange.shade800),
                      ],
                    ),
                    
                  ),
                ],
              ),

              const SizedBox(height: 10),

              //add horizontal scroll pet card
              SizedBox(
                height: 200.0,
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
                                          isFavourite? IconlyLight.heart: IconlyBold.heart,                        
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
                  Text('Based on Your Preferences', style: heading5Bold),
                  //const SizedBox(width: 15),
                  TextButton(
                    onPressed: (){}, 
                    child: Row(
                      children: [
                        Text('View All', style: bodyLBold.copyWith(color: primaryOrange.shade800)),
                        const SizedBox(width: 10),
                        Icon(IconlyLight.arrow_right, color: primaryOrange.shade800),
                      ],
                    ),
                    
                  ),
                ],
              ),

              const SizedBox(height: 10),
              SizedBox(
                height: 200.0,
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
                                          isFavourite? IconlyLight.heart: IconlyBold.heart,                        
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
              CircleBorder(),
            ),
            fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(60)),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: grey.shade300),
            ),
          ),
          child: Image.asset(image, width: 30, height: 30),
        ),
        const SizedBox(height: 8),
        Text(animal, style: bodyLMedium),
      ],
    );
  }


}