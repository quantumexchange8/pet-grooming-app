import 'package:adoptify/Pages/favouritePage.dart';
import 'package:adoptify/Pages/homePage.dart';
import 'package:adoptify/Pages/mapsPage.dart';
import 'package:adoptify/Pages/messagePage.dart';
import 'package:adoptify/Pages/profilePage.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BottomNaviBar extends StatefulWidget {
  final int initialIndex;
  const BottomNaviBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  final NavigationController controller = Get.put(NavigationController());

  @override
  void initState(){
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.selectedIndex.value = widget.initialIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (states){
                if(states.contains(MaterialState.selected)){
                  return bodyXSBold.copyWith(color: primaryOrange.shade800);
                }
                return bodyXSBold;
              },
            ),
          ), 
          child: NavigationBar(
          height: 70,
          elevation: 5,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: controller.selectedIndex.value == 0? Icon(IconlyBold.home, color: primaryOrange.shade800): Icon(IconlyLight.home),
              label:'Home',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 1? Icon(IconlyBold.location, color: primaryOrange.shade800): Icon(IconlyLight.location), 
              label: 'Maps'
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 2? Icon(IconlyBold.heart, color: primaryOrange.shade800): Icon(IconlyLight.heart), 
              label: 'Favourites'
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 3? Icon(IconlyBold.chat, color: primaryOrange.shade800): Icon(IconlyLight.chat), 
              label: 'Messages'
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 4? Icon(IconlyBold.profile, color: primaryOrange.shade800): Icon(IconlyLight.profile), 
              label: 'Account'
            ),
          ],
          ),
        ), 
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomePage(), const MapsPage(), const FavouritePage(), const MessagePage(), const ProfilePage()];
}