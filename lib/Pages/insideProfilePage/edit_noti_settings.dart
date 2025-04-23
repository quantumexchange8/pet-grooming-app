import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotiSettings extends StatefulWidget {
  const NotiSettings({super.key});

  @override
  State<NotiSettings> createState() => _NotiSettingsState();
}

class _NotiSettingsState extends State<NotiSettings> {

  final Map<String, bool> _switchStates = {
    'Adoption Updates': false,
    'Matching Preferences': false,
    'Favorites Updates': false,
    'Security Alerts': false,
    'Event Reminders': false,
    'Shelter Updates': false,
    'Community Engagement': false,
    'General App Updates': false,
    'Important Annoucements': false,
    'App Tips and Tutorials': false,
  };

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _loadSwitchStates();
    });
  }

  void _loadSwitchStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _switchStates['Adoption Updates'] = prefs.getBool('Adoption Updates') ?? false;
      _switchStates['Matching Preferences'] = prefs.getBool('Matching Preferences') ?? false;
      _switchStates['Favorites Updates'] = prefs.getBool('Favorites Updates')?? false;
      _switchStates['Security Alerts'] = prefs.getBool('Security Alerts')?? false;
      _switchStates['Event Reminders'] = prefs.getBool('Event Reminders') ?? false;
      _switchStates['Shelter Updates'] = prefs.getBool('Shelter Updates')?? false;
      _switchStates['Community Engagement'] = prefs.getBool('Community Engagement') ?? false;
      _switchStates['General App Updates'] = prefs.getBool('General App Updates')?? false;
      _switchStates['Important Annoucements'] = prefs.getBool('Important Annoucements')?? false;
      _switchStates['App Tips and Tutorials'] = prefs.getBool('App Tips and Tutorials')?? false;
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
        title: Text(context.tr('Notifications'), style: heading4Bold),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
        
              switchBuilder('Adoption Updates'),
              const SizedBox(height: 15),
              switchBuilder('Matching Preferences'),
              const SizedBox(height: 15),
              switchBuilder('Favorites Updates'),
              const SizedBox(height: 15),
              switchBuilder('Security Alerts'),
              const SizedBox(height: 15),
              switchBuilder('Event Reminders'),
              const SizedBox(height: 15),
              switchBuilder('Shelter Updates'),
              const SizedBox(height: 15),
              switchBuilder('Community Engagement'),
              const SizedBox(height: 15),
              switchBuilder('General App Updates'),
              const SizedBox(height: 15),
              switchBuilder('Important Announcements'),
              const SizedBox(height: 15),
              switchBuilder('App Tips and Tutorials'),
        
            ],
          ),
        ),
      ),
    );
  }

  Widget switchBuilder(String label){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(context.tr(label), style: heading5Semibold, overflow: TextOverflow.ellipsis, maxLines: 1),
        ),
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