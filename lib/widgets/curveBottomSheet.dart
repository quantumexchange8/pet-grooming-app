import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/onBoardingPages/walkthrough2.dart';
import 'package:adoptify/onBoardingPages/walkthrough3.dart';
import 'package:adoptify/onBoardingPages/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CurveBottomSheet extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  final int currentStep;
  final String page;

  const CurveBottomSheet({
    super.key, 
    required this.titleText,
    required this.descriptionText,
    required this.currentStep,
    required this.page,
    });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomSheetClipper(),
      child: Container(
        color: Theme.of(context).colorScheme.background, //light mode
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(titleText, style: heading3Bold, textAlign: TextAlign.center),
              const SizedBox(height: 8.0),
              Text(descriptionText, style: bodyXLRegular, textAlign: TextAlign.center),
              const SizedBox(height: 15.0),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 160),
                child: StepProgressIndicator(
                  totalSteps: 3,
                  currentStep: currentStep,
                  size: 7.0,
                  padding: 1.0,
                  roundedEdges: const Radius.circular(10),
                  customStep: (index, color, _) {
                    if (index == currentStep - 1) {
                    // If it's the current step, return a larger sized box
                      return Container(
                        width: 1.0, 
                        height: 3.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), 
                          color: primaryOrange.shade900,
                        ),
                      );
                    } else {
                      // For other steps, return a smaller sized dot
                      return Container(
                        width: 4.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grey.shade300,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              Divider(thickness: 1, color: grey.shade100),
          
              //button row
             _buttonBuilder(context),
              
          
            ],
          ),
        ),
      ),
    );
  }

Widget _buttonBuilder(BuildContext context){

  if(page == 'page1'){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: LightOrangeButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const WelcomePage()),
                );
              }, 
              text: 'Skip'),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: OrangeButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const Walkthrough2(),),
                );
              },  
              text: 'Continue',
            ),
          ),
        ],
      ),
    );

  }else if(page == 'page2'){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: LightOrangeButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const WelcomePage()),
                );
              }, 
              text: 'Skip'),
          ),
          const SizedBox(width: 15.0),

          Expanded(
            child: OrangeButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const Walkthrough3(),),
                );
              },  
              text: 'Continue',
            ),
          ),
        ],
      ),
    );

  }else{
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: OrangeButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const WelcomePage(),),
                );
              },  
              text: 'Let\'s Get Started',
            ),

          ),
        ],
      ),
    );
  }

}

}

class BottomSheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double curveHeight = 80;

    path.moveTo(0,0);
    path.lineTo(0, curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      2 * curveHeight,
      size.width,
      curveHeight,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


