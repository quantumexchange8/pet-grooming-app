import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/Pages/forgotPasswordPages/OTPcode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';


class ResetPasswordEmail extends StatefulWidget {
  const ResetPasswordEmail({super.key});

  @override
  State<ResetPasswordEmail> createState() => _ResetPasswordEmailState();
}

class _ResetPasswordEmailState extends State<ResetPasswordEmail> {
  TextEditingController emailController = TextEditingController();
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
                      Flexible(child: Text(context.tr('Forgot Your Password?'), style: heading3Bold.copyWith(fontSize: 31), overflow: TextOverflow.ellipsis, maxLines: 2)),
                      Image.asset('assets/image/key.png'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(context.tr('We\'ve got you covered. Enter your registered email to reset your password. We will send an OTP code to your email for the next steps.'),style: bodyXLRegular),
                  const SizedBox(height: 35),
                  Text(context.tr('Your Registered Email'), style: heading6Bold, textAlign: TextAlign.start,),
                  const SizedBox(height: 10),
                  TextField(
                    //onChanged:,
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
                
                ],
                
              ),
              
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              color: Theme.of(context).colorScheme.background,
                child: Row(
                  children: [
                    Expanded(
                      child: OrangeButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context)=>const OTPcode(),
                            ),
                          );
                        }, 
                        text: 'Send OTP Code'),
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