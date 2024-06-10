import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/insideProfilePage/Appearance.dart';
import 'package:adoptify/widgets/ProfileMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account',style: heading4Bold),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
          ProfileMenu(
            icon: Iconsax.eye, 
            topic: 'App Appearance', 
            onPress: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>AppearancePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}