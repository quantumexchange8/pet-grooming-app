import 'package:adoptify/Pages/SignUp/selectMatchAnimal.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StepProgressIndicator(
          totalSteps: 4,
          currentStep: 1,
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
            child: Text('1 / 4',style:heading6Bold),
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
                    Text(context.tr('Tell us about yourself'), style: heading3Bold),
                    const SizedBox(height: 10),
                    Text(context.tr('Are you a Pet Owner or Organization ready to find loving homes? Or a Pet Adopter looking for your new best friend?'),style: bodyXLRegular),
                    const SizedBox(height: 30),
                    Center(
                      child: GroupButton( //editing ing
                        buttons: [
                          context.tr("Pet Owner or Organization"),
                          context.tr("Pet Adopter")
                        ],
                        maxSelected: 1,
                        options: GroupButtonOptions(
                          //spacing: 50,
                          borderRadius: BorderRadius.circular(5),
                          runSpacing: 10,
                          mainGroupAlignment: MainGroupAlignment.center,
                          crossGroupAlignment: CrossGroupAlignment.center,
                          groupRunAlignment: GroupRunAlignment.center,
                          buttonHeight: 50,
                          buttonWidth: 350,
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
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=> const MatchAnimal(),
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