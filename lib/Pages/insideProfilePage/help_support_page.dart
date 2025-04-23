import 'package:adoptify/Pages/insideProfilePage/SidePages/contact_support_page.dart';
import 'package:adoptify/Pages/insideProfilePage/SidePages/faq_page.dart';
import 'package:adoptify/Pages/insideProfilePage/SidePages/privacy_policy_page.dart';
import 'package:adoptify/Pages/insideProfilePage/SidePages/terms_of_service.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/widgets/profile_detail_selection.dart';
import 'package:easy_localization/easy_localization.dart';
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
        title: Text(context.tr('Help & Support'), style: heading4Bold),
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