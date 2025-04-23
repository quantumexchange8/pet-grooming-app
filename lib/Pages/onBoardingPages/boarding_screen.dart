import 'package:adoptify/const/constant.dart';
import 'package:adoptify/Pages/onBoardingPages/splash_screen.dart';
import 'package:flutter/material.dart';


class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000),(){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context)=> const SplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryOrange.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 200, height: 200,
                child: Image.asset('assets/logo/logoWithWord.png', 
                color: Colors.white, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
        
        
      ),
    );
  }
}