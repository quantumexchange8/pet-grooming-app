import 'package:adoptify/Pages/SignUp/finalStepUserInfo.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BirdBreedPage extends StatefulWidget {
  const BirdBreedPage({super.key});

  @override
  State<BirdBreedPage> createState() => _BirdBreedPageState();
}

class _BirdBreedPageState extends State<BirdBreedPage> {
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
                    Text('Breed Preferences', style: heading3Bold),
                    const SizedBox(height: 10),
                    Text('Specify your preferences for the breed of the animal you\'d like to adopt, based on your previous choice. Select all that apply.',style: bodyXLRegular),
                    const SizedBox(height: 30),
                    
                    Center(
                      child: GroupButton(
                        buttons: const [
                          "Budgerigar", "Cockatiel", "Lovebird", "Parrotlet", "Canary", "Finch","Gouldian Finch", "Zebra Finch", "Quaker Parrot", "Conure", "African Grey Parrot",
                          "Amazon Parrot", "Cockatoo", "Eclectus Parrot", "Sun Conure", "Pionus Parrot", "Macaw", "Mynah Bird", "Dove", "Pigeon"
                        ],
                        maxSelected: 6,
                        isRadio: false,
                        enableDeselect: true,
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