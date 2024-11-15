import 'package:adoptify/Pages/insideProfilePage/AccoutAndSecurity.dart';
import 'package:adoptify/Pages/insideProfilePage/DataAnalytics.dart';
import 'package:adoptify/Pages/insideProfilePage/EditNotiSetting.dart';
import 'package:adoptify/Pages/insideProfilePage/EditProfile.dart';
import 'package:adoptify/Pages/insideProfilePage/HelpNSupport.dart';
import 'package:adoptify/Pages/insideProfilePage/LinkedAccount.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/Pages/insideProfilePage/Appearance.dart';
import 'package:adoptify/widgets/ProfileMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:group_button/group_button.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedPetType = '';

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final petOptions = [
      {'label': 'Dogs', 'image': 'assets/buttonPic/dog.png'},
      {'label': 'Cats', 'image': 'assets/buttonPic/cat.png'},
      {'label': 'Rabbits', 'image': 'assets/buttonPic/rabbit.png'},
      {'label': 'Birds', 'image': 'assets/buttonPic/bird.png'},
      {'label': 'Reptiles', 'image': 'assets/buttonPic/snake.png'},
      {'label': 'Fish', 'image': 'assets/buttonPic/fish.png'},
      {'label': 'Primates', 'image': 'assets/buttonPic/monkey.png'},
      {'label': 'Other', 'image': 'assets/buttonPic/other.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Account',style: heading4Bold),
        leading: Image.asset('assets/logo/paw_small.png'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 30)
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //user profile simple info

            Divider(thickness: 1, color: grey.shade200, indent: 15, endIndent: 15),
            //for List of buttons
            ListTile(
              leading: isLightMode? Image.asset('assets/icon/pawIcon_black.png'): Image.asset('assets/icon/pawIcon_white.png'),
              title: Text('My Pet Preferences', style: heading6Bold),
              trailing: const Icon(IconlyLight.arrow_right_2, size:20),
              onTap: (){
                showModalBottomSheet<void>(
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  context: context, 
                  builder: (BuildContext context){
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return SizedBox(
                          height: 320,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('My Pet Preferences', style: heading4Bold),
                                ),
                                Divider(thickness: 1, color: grey.shade300, height: 15.0),
                                Wrap(
                                  spacing: 12, children: petOptions.map((pet) {
                                    return selectedPetPreference(
                                      pet['image']!,
                                      pet['label']!,
                                      selectedPetType,
                                      (value) {
                                        setState(() {
                                          selectedPetType = value;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                               /*  GroupButton(
                                  isRadio: false,
                                  enableDeselect: true,
                                  maxSelected: 1,
                                  buttons: petOptions.map((e) => e['label']!).toList(),
                                  options: GroupButtonOptions(
                                    mainGroupAlignment: MainGroupAlignment.start,
                                    crossGroupAlignment: CrossGroupAlignment.start,
                                    selectedBorderColor: primaryOrange.shade800,
                                    unselectedBorderColor: grey.shade300,
                                    selectedColor: primaryOrange.shade800,
                                    unselectedColor: Theme.of(context).colorScheme.background,
                                    selectedTextStyle: bodyLBold.copyWith(color: Colors.white),
                                    unselectedTextStyle: bodyLBold.copyWith(color: Theme.of(context).colorScheme.primary),
                                    borderRadius: BorderRadius.circular(25),
                                    spacing: 10,
                                    
                                  ),
                                  buttonBuilder: (isSelected, label, context){
                                    final pet = petOptions.firstWhere((element) => element['label'] == label);
                                    return Container(
                                       decoration: BoxDecoration(
                                        color: isSelected ? primaryOrange.shade800 : Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: isSelected ? primaryOrange.shade800 : grey.shade300),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(pet['image']!, width: 20, height: 20),
                                          const SizedBox(width: 5),
                                          Text(
                                            label,
                                            style: TextStyle(
                                              color: isSelected ? Colors.white : Theme.of(context).colorScheme.primary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                  },
                                  /* onSelected: (label, index, isSelected){
                                    setState((){
                                      selectedPetType = isSelected ? label : '';
                                    });
                            
                                  }, */
                                ), */

                                Divider(thickness: 1, color: grey.shade300, height: 15.0),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: LightOrangeButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          text: 'Cancel',
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: OrangeButton(
                                          onPressed: () {
                                            //save function
                                            Navigator.pop(context);
                                          },
                                          text: 'OK',
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.profile, 
              topic: 'My Profile', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> const EditProfile(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.notification, 
              topic: 'Notifications', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> const NotiSettings(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.shield_done, 
              topic: 'Account & Security', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> const AccountSecurity(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.swap, 
              topic: 'Linked Accounts', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const LinkedAccount(),
                  ),
                );
              },
            ),
        
            ProfileMenu(
              icon: IconlyLight.show, 
              topic: 'App Appearance', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const AppearancePage(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.activity, 
              topic: 'Data & Analytics', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>const DataAnalytics(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.paper, 
              topic: 'Help & Support', 
              onPress: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const HelpAndSupport(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: IconlyLight.user_1, 
              topic: 'Invite Friends', 
              onPress: (){

              },
            ),

            ListTile(
              leading: const Icon(IconlyLight.logout, color: Color(0xFFF75555)),
              title: Text('Logout', style: heading6Bold.copyWith(color:const Color(0xFFF75555))),
              onTap: (){},
            ),
            
          ],
        ),
      ),
    );
  }

  Widget selectedPetPreference (String url, String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(url, width: 15,height: 15),
          const SizedBox(width: 3),
          Text(label),
        ],
      ), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(color: selectedValue == label? Colors.white: Colors.black),
      backgroundColor: Colors.white,
      selectedColor: primaryOrange.shade800,
      onSelected: (bool isSelected){
        //setState(() {
          onSelected(isSelected? label:'');
        //});
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: grey.shade300),
      ),
    );
  }

}