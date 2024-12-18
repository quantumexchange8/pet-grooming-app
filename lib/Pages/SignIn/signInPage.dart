import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/Pages/forgotPasswordPages/fillEmail.dart';
import 'package:adoptify/widgets/bottomNaviBar.dart';
import 'package:easy_localization/easy_localization.dart';
//import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:local_auth/local_auth.dart';



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


  final LocalAuthentication auth = LocalAuthentication();
  bool authenticated = false;
  
  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateInput);
    passwordController.addListener(_validateInput);

    WidgetsBinding.instance.addPostFrameCallback((_) { 
      _checkBiometric();
    });
    _checkDeviceSupport();
    /* auth.isDeviceSupported().then(
      (bool isSupported) => setState(() {}),
    ); */
    
  }

  Future<void> _checkDeviceSupport() async {
    try{
      bool isSupported = await auth.isDeviceSupported();
      setState(() {
        authenticated = isSupported;
      });
    }catch(e){
      showMessage('Error checking device support: $e');
    }
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

  //authentication
  Future<void> biometricAuthentication() async {
    bool deviceSupportsBiometric = false;
    try{
      bool authenticated = await auth.authenticate(
        localizedReason: 'Unlock Adoptify through your biometric ID',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
          biometricOnly: true,
        ),
      );
      if(authenticated){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute( 
            builder: (context) => const BottomNaviBar(),
          ),
        );
      }else{
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text('Authentication Failed', style: bodyLSemibold),
            content: Text('Biometric authentication failed, please try again.', style: bodyMRegular),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('OK', style: bodyLBold)
              ),
            ],
          )
        );
      }
    }catch(e){
      if(!deviceSupportsBiometric){
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text('Biometric Authentication Not Supported', style: bodyLSemibold),
            content: Text('No biometric enrolled on this device.', style: bodyMRegular),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('OK', style: bodyLBold)
              ),
            ],
          )
        );
      }
      setState(() {
        
      });

    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    print('List of available biometrics: $availableBiometrics');

    if(!mounted){
      return;
    }
  }

  Future<void> _checkBiometric() async {
    try{
      showMessage('Checking the biometrics...');
    }catch(e){
      showMessage('Error: $e');
    }
  }

  void showMessage(String message){
    if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.tr(message))),
      );
    }
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
                        Flexible(child: Text(context.tr('Welcome Back!'), style: heading3Bold, overflow: TextOverflow.ellipsis,maxLines: 2)),
                        Image.asset('assets/image/hi.png'),
                      ],
                    ),
                    Text(context.tr('Let\'s continue the journey with your furry friends.'),style: bodyXLRegular),
                    const SizedBox(height: 15),
                    Text(context.tr('Email'), style: heading6Bold),
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
                        hintText: context.tr('Email'),
                        hintStyle: bodyLRegular,
                        prefixIcon: const Icon(IconlyLight.message),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(context.tr('Password'), style: heading6Bold),
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
                        hintText: context.tr('Password'),
                        hintStyle: bodyLRegular,
                        prefixIcon: const Icon(IconlyLight.lock),
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
                              
                            Text(context.tr('Remember me'), style: bodyLRegular),
                          ],
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context)=> const ResetPasswordEmail(),
                                ),
                              );
                            }, 
                            child: Text(context.tr('Forgot Password?'),
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryOrange.shade800, 
                              fontFamily: GoogleFonts.urbanist().fontFamily),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
            
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(child: Divider(color: grey.shade200),),
                        Text(context.tr('    or    ')),
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

                    //for biometric log in 
                    Row(
                      children: [
                        Expanded(child: Divider(color: grey.shade200),),
                        Text(context.tr('    or    ')),
                        Expanded(child: Divider(color: grey.shade200),),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: LightOrangeButton(
                        onPressed: biometricAuthentication, 
                        text: 'Biometric Log In',
                      ),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                                height: 50, width: 50,
                                child: CircularProgressIndicator(
                                  strokeWidth: 7.0,
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation(primaryOrange.shade900), 
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              const SizedBox(height: 28.0),
                              Text(context.tr('Sign in...'), style: heading6Semibold)
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
                          builder: (context)=> const BottomNaviBar()),
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
                    child: Text(context.tr('Sign in'), 
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