import 'package:adoptify/Pages/SignUp/birdBreed.dart';
import 'package:adoptify/Pages/SignUp/catBreed.dart';
import 'package:adoptify/Pages/SignUp/dogBreed.dart';
import 'package:adoptify/Pages/SignUp/fishBreed.dart';
import 'package:adoptify/Pages/SignUp/horseBreed.dart';
import 'package:adoptify/Pages/SignUp/otherBreed.dart';
import 'package:adoptify/Pages/SignUp/primatesBreed.dart';
import 'package:adoptify/Pages/SignUp/rabbitBreed.dart';
import 'package:adoptify/Pages/SignUp/reptileBreed.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MatchAnimal extends StatefulWidget {
  const MatchAnimal({super.key});

  @override
  State<MatchAnimal> createState() => _MatchAnimalState();
}

class _MatchAnimalState extends State<MatchAnimal> {
  String? selectedAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StepProgressIndicator(
          totalSteps: 4,
          currentStep: 2,
          size: 10,
          padding: 0,
          selectedColor: primaryOrange.shade900,
          unselectedColor: grey.shade200,
          roundedEdges: const Radius.circular(15),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('2 / 4',style:heading6Bold),
          ),
        ],
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
                    Text('Let\'s Find Your Match!', style: heading3Bold),
                    const SizedBox(height: 10),
                    Text('What type of animal are you looking to adopt? Don\'t worry, you can always change this later.',style: bodyXLRegular),
                    const SizedBox(height: 30),
                    
                    Center(
                     child: GroupButton<String>(
                        buttons: [
                          "Dogs", "Cats", "Rabbits", "Birds", "Reptiles", "Fish", "Primates", "Horses", "Other"
                        ],
                        maxSelected: 1,
                        onSelected: (button, index, isSelected){
                          setState(() {
                            selectedAnimal = button;
                          });
                        },
                        buttonBuilder: (selected, button, context) {
                          final Map<String,String> images = {
                            "Dogs": "assets/buttonPic/dog.png",
                            "Cats": "assets/buttonPic/cat.png",
                            "Rabbits": "assets/buttonPic/rabbit.png",
                            "Birds": "assets/buttonPic/bird.png",
                            "Reptiles": "assets/buttonPic/snake.png",
                            "Fish": "assets/buttonPic/fish.png",
                            "Primates": "assets/buttonPic/monkey.png",
                            "Horses": "assets/buttonPic/horse.png",
                            "Other": "assets/buttonPic/other.png",
                          };

                          return Container(
                            height: 120,
                            width: 100,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                             // color: selected? 
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: selected? primaryOrange.shade900:grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  images[button]!,
                                  height: 50, width: 50,
                                ),
                                const SizedBox(height: 5),
                                Text(button, style: heading6Medium, textAlign: TextAlign.center),
                                
                              ],
                            ),
                          );
                        },
                        options: GroupButtonOptions(
                            groupingType: GroupingType.wrap,
                            runSpacing: 15,
                            buttonHeight: 150,
                            buttonWidth: 100,
                            mainGroupAlignment: MainGroupAlignment.start,
                            crossGroupAlignment: CrossGroupAlignment.start,
                            groupRunAlignment: GroupRunAlignment.start,
                            selectedBorderColor: primaryOrange.shade800,
                            selectedColor: Colors.transparent,
                            unselectedColor: Colors.transparent,
                            unselectedBorderColor: grey.shade300,
                            selectedTextStyle: heading5Semibold,
                            unselectedTextStyle: heading5Semibold, 
                        ),
                      ), 
                    ),

                  
                  ],
                ),
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              child: Row(
                children: [
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        if(selectedAnimal != null){
                          switch(selectedAnimal){
                            case "Dogs":
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context)=> DogBreedPage(),
                                ),
                              );
                              break;
                            case "Cats":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> CatBreedPage(),
                                  ),
                                );
                              break;
                            case "Rabbits":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> RabbitBreedPage(),
                                  ),
                                );
                              break;
                            case "Birds":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> BirdBreedPage(),
                                  ),
                                );
                              break;
                            case "Reptiles":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> ReptilesBreedPage(),
                                  ),
                                );
                              break;
                            case "Fish":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> FishBreedPage(),
                                  ),
                                );
                              break;
                            case "Primates":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> PrimatesBreedPage(),
                                  ),
                                );
                              break;
                            case "Horses":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> HorseBreedPage(),
                                  ),
                                );
                              break;
                            case "Other":
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context)=> OtherBreedPage(),
                                  ),
                                );
                              break;

                            default:
                              break;
                          }
                        }
                      }, 
                      text: 'Continue',
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
}