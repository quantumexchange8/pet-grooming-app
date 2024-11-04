import 'package:adoptify/Pages/searchResultPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedLocation = '';
  String selectedPetType = '';
  String selectedGender = '';
  String selectedSize = '';
  String selectedAge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Pet Search', style: heading4Bold),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //location
                    Text('Location', style: heading5Bold),
                    const SizedBox(height: 15),
                    //pet types
                    Text('Pet Types', style: heading5Bold),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        selectedSearchPet('assets/buttonPic/dog.png','Dogs', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/cat.png','Cats', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/rabbit.png','Rabbits', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/bird.png','Birds', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/snake.png','Reptiles', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/fish.png','Fish', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/monkey.png','Primates', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/other.png','Other', selectedPetType, (value) => selectedPetType = value),
                      ],
                    ),
                    const SizedBox(height: 15),
              
                    //gender(optional)
                    Row(
                      children: [
                        Text('Gender', style: heading5Bold),
                        const SizedBox(width: 5),
                        Text('(Optional)', style: bodyLRegular.copyWith(color: grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        searchOptionalChoice('Any', selectedGender, (value) => selectedGender = value),
                        searchOptionalChoice('Male', selectedGender, (value) => selectedGender = value),
                        searchOptionalChoice('Female', selectedGender, (value) => selectedGender = value),
                      ],
                    ),
                    const SizedBox(height: 15),
              
              
                    //size(optional)
                    Row(
                      children: [
                        Text('Size', style: heading5Bold),
                        const SizedBox(width: 5),
                        Text('(Optional)', style: bodyLRegular.copyWith(color: grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        searchOptionalChoice('Small', selectedSize, (value) => selectedSize = value),
                        searchOptionalChoice('Medium', selectedSize, (value) => selectedSize = value),
                        searchOptionalChoice('Large', selectedSize, (value) => selectedSize = value),
                      ],
                    ),
                    const SizedBox(height: 15),
              
              
                    //age(optional)
                     Row(
                      children: [
                        Text('Age', style: heading5Bold),
                        const SizedBox(width: 5),
                        Text('(Optional)', style: bodyLRegular.copyWith(color: grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        searchOptionalChoice('Baby', selectedAge, (value) => selectedAge = value),
                        searchOptionalChoice('Young', selectedAge, (value) => selectedAge = value),
                        searchOptionalChoice('Adult', selectedAge, (value) => selectedAge = value),
                        searchOptionalChoice('Senior', selectedAge, (value) => selectedAge = value),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              //color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SearchResult(selectedPetType: selectedPetType)),
                        );
                      }, 
                      text: 'Search',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget selectedSearchPet (String url, String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(url, width: 15,height: 15),
          const SizedBox(width: 3),
          Text(label),
        ],
      ), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(
        color: selectedValue == label? Colors.white: Colors.black),
      backgroundColor: Colors.white,
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

  Widget searchOptionalChoice (String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Text(label), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(
        color: selectedValue == label? Colors.white: Colors.black),
      backgroundColor: Colors.white,
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


}