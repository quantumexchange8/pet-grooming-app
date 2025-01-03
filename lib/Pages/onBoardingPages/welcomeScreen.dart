import 'package:adoptify/Pages/SignIn/signInPage.dart';
import 'package:adoptify/Pages/SignUp/signUpPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
     // Get the current theme's brightness
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35.0),
            Image.asset('assets/logo/Logo_orange.png'),
            const SizedBox(height: 30.0),
            Text(context.tr('Let\'s Get Started!'), style: heading3Bold),
            const SizedBox(height: 10.0),
            Text(context.tr('Let\'s dive into your account'), style: bodyXLRegular),
            const SizedBox(height: 50.0),

            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: 'assets/icon/google_icon.png', 
              text: 'Continue with Google',
            ),
            const SizedBox(height: 15.0),
            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: isLightMode? 'assets/icon/apple_icon.png':'assets/icon/white_apple_logo.png', 
              text: 'Continue with Apple'
            ),
            const SizedBox(height: 15.0),
            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: 'assets/icon/fb_icon.png', 
              text: 'Continue with Facebook'
            ),
            const SizedBox(height: 15.0),
            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: 'assets/icon/twitter_icon.png', 
              text: 'Continue with Twitter'
            ),
            const SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: OrangeButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> const SignUp(),
                        ),
                      );
                    }, 
                    text: 'Sign up'),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: LightOrangeButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> const SignIn(),
                        ),
                      );
                    }, 
                    text: 'Sign in'
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(context.tr('Privacy Policy   .   Terms of Service'),style: bodySMedium),
          ],
        ),
      ),
    );
  }
}