import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/forgotPasswordPages/fillEmail.dart';
import 'package:adoptify/widgets/bottomNaviBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isVisible = false;
  bool isChecked = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  //login api
  
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
                        Text('Welcome Back!', style: heading3Bold),
                        Image.asset('assets/image/hi.png'),
                      ],
                    ),
                    Text('Let\'s continue the journey with your furry friends.',style: bodyXLRegular),
                    const SizedBox(height: 15),
                    Text('Email', style: heading6Bold),
                    const SizedBox(height: 5),
                    TextField(
                      onChanged: (value){
                        setState(() {
                          _isEmailValid = _isEmailValidFunction(value);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,                
                        ),
                        isDense: true,
                        hintText: 'Email',
                        hintStyle: bodyLRegular,
                        prefixIcon: const Icon(Iconsax.sms),
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
                          icon: _isVisible? const Icon(Iconsax.eye):const Icon(Iconsax.eye_slash),
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
                        prefixIcon: const Icon(Iconsax.lock_1),
                      ),
                    ),
              
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                              
                            Text('Remember me', style: bodyLRegular),
                          ],
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=> const ResetPasswordEmail(),
                              ),
                            );
                          }, 
                          child: Text('Forgot Password?',
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
                      iconUrl: 'assets/logo/google_icon.png', 
                      text: 'Continue with Google'
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
                              Text('Sign in...', style: heading6Semibold)
                            ],
                          )
                        ),
                      ),
                      ),
                      );
                     Future.delayed(Duration(seconds: 2),(){
                       Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=> BottomNaviBar()),
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
                    child: Text('Sign in', 
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