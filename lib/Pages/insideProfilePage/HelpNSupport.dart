import 'package:adoptify/Pages/insideProfilePage/SidePages/ContactSupport.dart';
import 'package:adoptify/Pages/insideProfilePage/SidePages/FaqPage.dart';
import 'package:adoptify/Pages/insideProfilePage/SidePages/PrivacyPolicy.dart';
import 'package:adoptify/Pages/insideProfilePage/SidePages/TermsOfService.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/widgets/ProfileDetailSelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support', style: heading4Bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileDetailSelection(topic: 'FAQ', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
              }),

            ProfileDetailSelection(topic: 'Contact Support', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ContactSupport()),
                );
              }),
            ProfileDetailSelection(topic: 'Privacy Policy', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                );
              }),
            ProfileDetailSelection(topic: 'Terms of Service', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const TermsOfService()),
                );
              }),
            ProfileDetailSelection(topic: 'Partner', onPress: (){}),
            ProfileDetailSelection(topic: 'Job Vacancy', onPress: (){}),
            ProfileDetailSelection(topic: 'Accessibility', onPress: (){}),
            ProfileDetailSelection(topic: 'Feedback', onPress: (){}),
            ProfileDetailSelection(topic: 'About us', onPress: (){}),
            ProfileDetailSelection(topic: 'Rate us', onPress: (){}),
            ProfileDetailSelection(topic: 'Visit Our Website', onPress: (){}),
            ProfileDetailSelection(topic: 'Follow us on Social Media', onPress: (){}),
          ],
        ),
      ),
    );
  }
}