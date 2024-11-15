import 'package:adoptify/Pages/SignIn/signInPage.dart';
import 'package:adoptify/Pages/SignUp/ChoicePage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isVisible = false;
  bool isChecked = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  
   @override
  void initState() {
    super.initState();
    emailController.addListener(_validateInput);
    passwordController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isEmailValid = _isEmailValidFunction(emailController.text);
      _isPasswordValid = _isPasswordValidFunction(passwordController.text);
    });
  }

  bool _isEmailValidFunction(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValidFunction(String password) {
    final RegExp passwordRegex = RegExp(r'^(?=.[a-zA-Z]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    // Get the current theme's brightness
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Join Adoptify Today', style: heading3Bold),
                        Image.asset('assets/image/paws.png'),
                      ],
                    ),
                    Text('A world of furry possibilities awaits you.',style: bodyXLRegular),
                    const SizedBox(height: 15),
                    Text('Email', style: heading6Bold),
                    const SizedBox(height: 5),
                    TextField(
                      onChanged:(value){
                        setState(() {
                          _isEmailValid = _isEmailValidFunction(value);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:Theme.of(context).colorScheme.secondary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,                
                        ),
                        isDense: true,
                        hintText: 'Email',
                        hintStyle: bodyLRegular,
                        prefixIcon: const Icon(IconlyLight.message),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text('Password', style: heading6Bold),
                    const SizedBox(height: 5),
                    TextField(
                      onChanged:(value){
                        setState(() {
                          _isPasswordValid = _isPasswordValidFunction(value);
                        });
                      },
                      controller: passwordController,
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible? const Icon(IconlyLight.show):const Icon(IconlyLight.hide),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,                
                        ),
                        isDense: true,
                        hintText: 'Password',
                        hintStyle: bodyLRegular,
                        prefixIcon: const Icon(IconlyLight.lock),
                      ),
                    ),
              
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked , 
                          onChanged: (bool? value){
                            setState(() {
                              isChecked = value?? false;
                            });
                          },
                          side: MaterialStateBorderSide.resolveWith((states) => 
                          BorderSide(
                            color: isChecked? primaryOrange.shade300: primaryOrange.shade900
                          ),),
                          checkColor: Colors.white,
                          activeColor: primaryOrange.shade900,
                        ),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to Adoptify ', style: bodyLRegular),
                              
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: primaryOrange.shade800,
                                  fontFamily: GoogleFonts.urbanist().fontFamily,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle tap for terms & conditions
                                  },
                              ),

                              TextSpan(text: '.', style: bodyLRegular),
                            ],
                          ),
                        ),
                      ],
                    ),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?', style: bodyLRegular),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>const SignIn(),
                              ),
                            );
                          }, 
                          child: Text('Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            color: primaryOrange.shade800, 
                            fontFamily: GoogleFonts.urbanist().fontFamily),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(child: Divider(color: grey.shade200),),
                        const Text('    or    '),
                        Expanded(child: Divider(color: grey.shade200),),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GreyOutlineButton(
                      onPressed: (){}, 
                      iconUrl: 'assets/icon/google_icon.png', 
                      text: 'Continue with Google'
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
                    child: FilledButton(
                    onPressed: _isEmailValid && _isPasswordValid?(){
                      showDialog(context: context, 
                      builder: (context) =>AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.20, 
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 45, width: 45,
                                child: CircularProgressIndicator(
                                  strokeWidth: 7.0,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation(primaryOrange.shade900), 
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              const SizedBox(height: 28.0),
                              Text('Sign up...', style: heading6Semibold)
                            ],
                          )
                        ),
                      ),
                      ),
                      );
                     Future.delayed(const Duration(seconds: 2),(){
                       Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> const ChoicePage()),
                      );
                     });
                    }:null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states){
                        if(states.contains(MaterialState.disabled)){
                          return const Color(0xffbd741e);
                        }
                        return primaryOrange.shade900;
                      }
                    ),
                      fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
                    ),
                    child: Text('Sign up', 
                      style: TextStyle(
                        fontFamily: GoogleFonts.urbanist().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),
                      ),
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
   @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  
}