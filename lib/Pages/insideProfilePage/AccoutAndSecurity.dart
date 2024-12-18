import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/widgets/ProfileDetailSelection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({super.key});

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {

//for the biometric (local_auth), enable the function here 
  final Map<String, bool> _switchStates = {
    'Biometric ID': false,
    'Face ID': false,
    'SMS Authenticator': false,
    'Google Authenticator': false,
  };

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSwitchStates();
    });
  }

  void _loadSwitchStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _switchStates['Biometric ID'] = prefs.getBool('Biometric ID')?? false;
      _switchStates['Face ID'] = prefs.getBool('Face ID')?? false;
      _switchStates['SMS Authenticator'] = prefs.getBool('SMS Authenticator')?? false;
      _switchStates['Google Authenticator'] = prefs.getBool('Google Authenticator')?? false;
    });
  }

  void _saveSwitchStates(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(context.tr('Account & Security'), style: heading4Bold),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  switchBuilder('Biometric ID'),// iphone only got face id
                  const SizedBox(height: 15),
                  switchBuilder('Face ID'),
                  const SizedBox(height: 15),
                  switchBuilder('SMS Authenticator'),
                  const SizedBox(height: 15),
                  switchBuilder('Google Authenticator'),
                  
                ],
              ),
            ),
            ProfileDetailSelection(
              topic: 'Change Password', 
              onPress: (){}
            ),
            const SizedBox(height: 15),

            ProfileDetailSelection(
              topic: 'Device Management', 
              onPress: (){}
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Text(context.tr('Manage your account on the various devices you own.'), style: bodyLRegular),
            ),
            const SizedBox(height: 15),

            ProfileDetailSelection(
              topic: 'Deactivate Account', 
              onPress: (){}
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Text(context.tr('Temporarily deactivate your account. Easily reactivate when you\'re ready.'), style: bodyLRegular),
            ),
            const SizedBox(height: 15),

            ListTile(
              title: Text(context.tr('Delete Account'), style: heading6Bold.copyWith(color: const Color(0xFFF75555)),),
              trailing: const Icon(IconlyLight.arrow_right_2, size:20),
              onTap: (){},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Text(context.tr('Permanently remove your account and data. Proceed with caution.'), style: bodyLRegular),
            ),
          ],
        ),
      ),
    );
  }

  Widget switchBuilder(String label){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(context.tr(label), style: heading5Semibold),
        Switch(
          value: _switchStates[label] ?? false,
          onChanged: (value){
            setState(() {
              _switchStates[label] = value;
              _saveSwitchStates(label, value);
            });
          },
          activeColor: Colors.white,
          inactiveThumbColor: Colors.white,
          activeTrackColor: primaryOrange.shade900,
          inactiveTrackColor: Theme.of(context).colorScheme.tertiaryContainer,
        ),
      ],
    );
  }

}