import 'package:adoptify/const/constant.dart';
import 'package:adoptify/onBoardingPages/walkthrough1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _showProgressIndicator = false;

  void _onTap(){
    setState(() {
      _showProgressIndicator = true;
    });
    Future.delayed(const Duration(seconds:1), (){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=> const Walkthrough1())
      );
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        onTap: _onTap,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryOrange.shade900,
                image: const DecorationImage(
                  image: AssetImage('assets/logo/logoWithWord.png'),
                ),
              ), 
              
            ),
         
            if (_showProgressIndicator)
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 80.0),
                child: SizedBox(
                  width: 45, height: 45,
                  child: CircularProgressIndicator(
                    strokeWidth: 7.0,
                    backgroundColor: Colors.white60,
                    valueColor: AlwaysStoppedAnimation(Colors.white), 
                    strokeCap: StrokeCap.round,
                    
                  ),
                ),
            ),
             
            ),
          ],
        ),
      ),
      
      
    );
  }
}