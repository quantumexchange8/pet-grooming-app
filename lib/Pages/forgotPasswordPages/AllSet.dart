import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/widgets/bottomNaviBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllSet extends StatelessWidget {
  const AllSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/allSet.png'),
                    const SizedBox(height: 15),
                    Text(context.tr('You\'re All Set!'), style: heading3Bold),
                    const SizedBox(height: 10),
                    Text(context.tr('Your password has been successfully changed.'), style: bodyLRegular,textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          

          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
            //color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=>const BottomNaviBar(),
                          ),
                        );
                      }, 
                      text: 'Go to Homepage'),
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