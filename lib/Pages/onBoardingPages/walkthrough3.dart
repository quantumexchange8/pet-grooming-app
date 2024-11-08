import 'package:adoptify/const/constant.dart';
import 'package:adoptify/widgets/curveBottomSheet.dart';
import 'package:flutter/material.dart';

class Walkthrough3 extends StatefulWidget {
  const Walkthrough3({super.key});

  @override
  State<Walkthrough3> createState() => _Walkthrough3State();
}

class _Walkthrough3State extends State<Walkthrough3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange.shade900,
              image: const DecorationImage(
                image: AssetImage('assets/image/walkthrough_image3.png'),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CurveBottomSheet(
              currentStep: 3,
              titleText: 'Connect with Caring Pet Owners Around You',
              descriptionText: 'Easily connect with pet owners, ask about animals, & make informed decisions. Adoptify is here to guide you every step of the way.', 
              page: 'page3',
            ),
          ),
        ],
      ),
    );
  }
}