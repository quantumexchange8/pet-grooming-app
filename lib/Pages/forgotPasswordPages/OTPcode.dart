import 'dart:async';

import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/Pages/forgotPasswordPages/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPcode extends StatefulWidget {
  const OTPcode({super.key});

  @override
  State<OTPcode> createState() => _OTPcodeState();
}

class _OTPcodeState extends State<OTPcode> {
  String otp = '';
  Timer? _timer;
  int _countdown = 60;
  bool canResend = false;

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  void dispose(){
    super.dispose();
    _timer!.cancel();
  }

  void startTime(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
    setState(() {
      if(_countdown>0){
      _countdown--;
      }else{
        _timer?.cancel();
      }
    });

    });
  }

  void _resendOtp(){
     if(canResend){
      setState(() {
        _countdown = 60;
        canResend = false;
      });
      startTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Enter OTP Code', style: heading3Bold),
                      const SizedBox(width: 5),
                      Image.asset('assets/image/lock_key.png'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('Please check your email inbox for a message from Adoptify. Enter the one-time verification code below.',style: bodyXLRegular),
                  const SizedBox(height: 35),

                  PinCodeTextField(
                    appContext: context, 
                    length: 4,
                    enableActiveFill: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60.0,
                      fieldWidth: 70.0,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      inactiveColor: Theme.of(context).colorScheme.secondary,
                      selectedColor: primaryOrange.shade700,
                      borderRadius: BorderRadius.circular(10.0),
                      borderWidth: 1,
                      selectedFillColor: Theme.of(context).colorScheme.tertiary,
                      inactiveFillColor: Theme.of(context).colorScheme.secondary,
                      activeFillColor: Theme.of(context).colorScheme.secondary,
                      
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 10),

                  //Countdown for sending code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: bodyLRegular,
                          children: <TextSpan>[
                            TextSpan(text: 'You can resend the code in ', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                            TextSpan(text: '${_countdown.toString()} ', style: TextStyle(color: primaryOrange.shade800)),
                            TextSpan(text: 'seconds.', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){
                          _resendOtp();
                        }, 
                      child: Text('Resend code', style: bodyLMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              child: Row(
                children: [
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=>const EditNewPassword(),
                          ),
                        );
                      }, 
                      text: 'Continue'),
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}