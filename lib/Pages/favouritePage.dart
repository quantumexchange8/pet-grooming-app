import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/widgets/petDisplayCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  String selectedPetCategory = 'All';
  
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        leading: Image.asset('assets/logo/paw_small.png'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.tr('Favorites'), style: heading4Bold),
            const SizedBox(width: 5),
            Consumer<FavouriteController>(
              builder: (context, favouriteProvider, child) {
                int favouriteCount = favouriteProvider.getFilteredFavourites(selectedPetCategory).length;
                return Text('($favouriteCount)', style: heading4Bold);
              },
            ),
          ],
        ),
        centerTitle: true,
        actions: [ 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(IconlyLight.search, size: 25),
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 30)
          ),
        ],
      ),
    
      body: Consumer<FavouriteController>(
        builder: (context, favouriteController, child){
          String allCategory = 'All';
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                //list of button of category
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 10, children: [

                      ChoiceChip(
                        showCheckmark: false,
                        label: Text(allCategory), 
                        selected: selectedPetCategory == allCategory,
                        labelStyle: bodyLSemibold.copyWith(
                          color: selectedPetCategory == allCategory? Colors.white : Theme.of(context).colorScheme.primary),
                        backgroundColor: Theme.of(context).colorScheme.background,
                        selectedColor: primaryOrange.shade800,
                        onSelected: (bool isSelected){
                          setState(() {
                            selectedPetCategory = isSelected? allCategory : '';
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: grey.shade300),
                        ),
                      ),
              
                      petCategoryButton('assets/buttonPic/dog.png', 'Dogs', selectedPetCategory, 
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
              
                      petCategoryButton('assets/buttonPic/cat.png', 'Cats', selectedPetCategory,  
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
              
                      petCategoryButton('assets/buttonPic/rabbit.png', 'Rabbits', selectedPetCategory,  
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
              
                      petCategoryButton('assets/buttonPic/bird.png', 'Birds', selectedPetCategory,  
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
              
                      petCategoryButton('assets/buttonPic/snake.png', 'Reptiles', selectedPetCategory, 
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }), 
              
                      petCategoryButton('assets/buttonPic/fish.png', 'Fish', selectedPetCategory,  
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
              
                      petCategoryButton('assets/buttonPic/monkey.png', 'Primates', selectedPetCategory,  
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
              
                      petCategoryButton('assets/buttonPic/other.png', 'Other', selectedPetCategory,  
                        (value){
                          setState(() {
                            selectedPetCategory = value;
                          });
                        }),
                    ],
                  ),
                ),
              
              const SizedBox(height: 15),
              
              //list of favourite pet (dynamic based on the button clicked)
              Expanded(
                child: _buildFavouritePage(),
              ),
              ],
            ),
          );
        },
      ),
    );
  }

  //for the favourite pet based on category (button)
  Widget petCategoryButton (String url, String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Row(
        children: [
          Image.asset(url, width: 15,height: 15),
          const SizedBox(width: 3),
          Text(context.tr(label)),
        ],
      ), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(
        color: selectedValue == label? Colors.white: Theme.of(context).colorScheme.primary),
      backgroundColor: Theme.of(context).colorScheme.background,
      selectedColor: primaryOrange.shade800,
      onSelected: (bool isSelected){
        setState(() {
          onSelected(isSelected? label:'');
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: grey.shade300),
      ),
    );
  }



  Widget _buildFavouritePage(){
    final favorProvider = Provider.of<FavouriteController>(context);
    final favourites = favorProvider.getFilteredFavourites(selectedPetCategory);

    if(favourites.isEmpty){
      return Center(
        child: Text(context.tr('No favorites yet'), style: bodyLBold),
      );
    }else{
      return GridView.builder( //spacing error
          itemCount: favourites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.78,
          ), 
          itemBuilder: (context, index){
            final favorPetto = favourites[index];

            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => PetDetailPage(petDetails: favorPetto),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: PetCardDisplay(
                  petImage: favorPetto.petImage, 
                  petName: favorPetto.petName, 
                  petDistance: favorPetto.distanceFromPet, 
                  petBreed:favorPetto. petBreed, 
                  pet: favorPetto,
                ),
              ),
            );
          },         
        );
    }
  }


}