import 'package:adoptify/Pages/SignUp/finalStepUserInfo.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HorseBreedPage extends StatefulWidget {
  const HorseBreedPage({super.key});

  @override
  State<HorseBreedPage> createState() => _HorseBreedPageState();
}

class _HorseBreedPageState extends State<HorseBreedPage> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StepProgressIndicator(
          totalSteps: 4,
          currentStep: 3,
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
            child: Text('3 / 4',style:heading6Bold),
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
                    Text(context.tr('Breed Preferences'), style: heading3Bold),
                    const SizedBox(height: 10),
                    Text(context.tr('Specify your preferences for the breed of the animal you\'d like to adopt, based on your previous choice. Select all that apply.'),style: bodyXLRegular),
                    const SizedBox(height: 30),
                    
                    Center(
                      child: GroupButton(
                        buttons: const [
                          "Arabian", "Thoroughbred", "American Quarter Horse", "Clydesdale", "Shire", "Friesian", "Mustang", "Appaloosa", "Paint Horse", "Morgan", "Andalusian", "Shetland Pony",
                          "Tennessee Walking Horse", "Icelandic Horse", "Percheron", "Belgian Draft Horse", "Haflinger", "Paso Fino", "Gypsy Vanner", "Akhal-Teke", "Warmblood", "Rocky Mountain Horse",
                          "Lippizzaner", "Fjord Horse"
                        ],
                        maxSelected: 6,
                        enableDeselect: true,
                        isRadio: false,
                        options: GroupButtonOptions(
                          mainGroupAlignment: MainGroupAlignment.start,
                          selectedBorderColor: primaryOrange.shade800,
                          unselectedBorderColor: grey.shade300,
                          selectedColor: primaryOrange.shade800,
                          unselectedColor: Theme.of(context).colorScheme.background,
                          selectedTextStyle: bodyLBold.copyWith(color: Colors.white),
                          unselectedTextStyle: bodyLBold.copyWith(color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(25),                        
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
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=> const FinalStepUserInfo(),
                          ),
                        );
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