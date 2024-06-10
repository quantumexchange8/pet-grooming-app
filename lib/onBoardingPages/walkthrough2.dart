import 'package:adoptify/const/constant.dart';
import 'package:adoptify/widgets/curveBottomSheet.dart';
import 'package:flutter/material.dart';

class Walkthrough2 extends StatefulWidget {
  const Walkthrough2({super.key});

  @override
  State<Walkthrough2> createState() => _Walkthrough2State();
}

class _Walkthrough2State extends State<Walkthrough2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange.shade900,
              image: const DecorationImage(
                image: AssetImage('assets/image/walkthrough_image2.png'),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CurveBottomSheet(
              currentStep: 2,
              titleText: 'Explore a World of Companionship',
              descriptionText: 'Discover a diverse array of adorable companions, find your favorites, and let the tail-wagging adventure begin.', 
              page: 'page2',
            ),
          ),
        ],
      ),
    );
  }
}