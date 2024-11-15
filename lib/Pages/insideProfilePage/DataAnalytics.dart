import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/widgets/ProfileDetailSelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataAnalytics extends StatefulWidget {
  const DataAnalytics({super.key});

  @override
  State<DataAnalytics> createState() => _DataAnalyticsState();
}

class _DataAnalyticsState extends State<DataAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data & Analytics', style: heading4Bold),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileDetailSelection(
              topic: 'Data Usage', 
              onPress: (){}
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Text('Control how your data is used for analytics. Customize your preferences.', style: bodyLRegular),
            ),
            const SizedBox(height: 15),

            ProfileDetailSelection(
              topic: 'Ad Preferences', 
              onPress: (){}
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Text('Manage ad personalization settings. Tailor your ad experience.', style: bodyLRegular),
            ),
            const SizedBox(height: 15),

            ProfileDetailSelection(
              topic: 'Download My Data', 
              onPress: (){}
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 40),
              child: Text('Request a copy of your data. Your information, your control.', style: bodyLRegular),
            ),
            const SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}