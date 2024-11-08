import 'package:adoptify/const/constant.dart';
import 'package:adoptify/widgets/curveBottomSheet.dart';
import 'package:flutter/material.dart';

class Walkthrough1 extends StatefulWidget {
  const Walkthrough1({super.key});

  @override
  State<Walkthrough1> createState() => _Walkthrough1State();
}

class _Walkthrough1State extends State<Walkthrough1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange.shade900,
              image: const DecorationImage(
                image: AssetImage('assets/image/walkthrough_image1.png'),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CurveBottomSheet(
              currentStep: 1,
              titleText: 'Adoptify - Where Furry Tales Begin',
              descriptionText: 'Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend.', 
              page: 'page1',
            ),
          ),
        ],
      ),
      
    );
  }
 
}


