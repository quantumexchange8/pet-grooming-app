import 'package:adoptify/SignIn/signInPage.dart';
import 'package:adoptify/SignUp/signUpPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
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
            Text('Let\'s Get Started!', style: heading3Bold),
            const SizedBox(height: 10.0),
            Text('Let\'s dive into your account', style: bodyXLRegular),
            const SizedBox(height: 50.0),

            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: 'assets/logo/google_icon.png', 
              text: 'Continue with Google',
            ),
            const SizedBox(height: 15.0),
            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: isLightMode? 'assets/logo/apple_icon.png':'assets/logo/white_apple_logo.png', 
              text: 'Continue with Apple'
            ),
            const SizedBox(height: 15.0),
            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: 'assets/logo/fb_icon.png', 
              text: 'Continue with Facebook'
            ),
            const SizedBox(height: 15.0),
            GreyOutlineButton(
              onPressed: (){}, 
              iconUrl: 'assets/logo/twitter_icon.png', 
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
                          builder: (context)=> SignUp(),
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
                          builder: (context)=> SignIn(),
                        ),
                      );
                    }, 
                    text: 'Sign in'
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text('Privacy Policy   .   Terms of Service',style: bodySMedium),
          ],
        ),
      ),
    );
  }
}