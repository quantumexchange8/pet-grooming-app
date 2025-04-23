import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: Text(context.tr('Contact Support'), style: heading4Bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _contactList('assets/icon/cs_icon_orange.png','Customer Support', (){}),
              const SizedBox(height: 15),
              _contactList('assets/icon/website_icon_orange.png','Website', (){}),
              const SizedBox(height: 15),
              _contactList('assets/icon/ws_icon_orange.png','WhatsApp', (){}),
              const SizedBox(height: 15),
              _contactList('assets/icon/fb_icon_orange.png','Facebook', (){}),
              const SizedBox(height: 15),
              _contactList('assets/icon/twitter_icon_orange.png','Twitter', (){}),
              const SizedBox(height: 15),
              _contactList('assets/icon/ig_icon_orange.png','Instagram', (){}),

            ],
          ),
        ),
      ),


    );
  }

  Widget _contactList(String iconPicUrl, String label, VoidCallback onPress){
    return GestureDetector( //need some tap effect
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(iconPicUrl),
                  const SizedBox(width: 10),
                  Text(context.tr(label), style: bodyXLBold.copyWith(color: Theme.of(context).colorScheme.primary),),
                ],
              ),
              const Icon(IconlyLight.arrow_right_2, size:20),
            ],
          ),
        ),
      ),
    );
  }
}