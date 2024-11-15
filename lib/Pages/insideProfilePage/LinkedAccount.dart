import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkedAccount extends StatefulWidget {
  const LinkedAccount({super.key});

  @override
  State<LinkedAccount> createState() => _LinkedAccountState();
}

class _LinkedAccountState extends State<LinkedAccount> {

  final Map<String, bool> _isConnected = {
    'Google': false,
    'Apple': false,
    'Facebook': false,
    'Twitter': false,
  };

  void _toggleConnection(String platform){
    setState(() {
      _isConnected[platform] = !_isConnected[platform]!;

      //can put function of connection social media here
    });
  }
 
  @override
  Widget build(BuildContext context) {

    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: Text('Linked Accounts', style: heading4Bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            //Google
            accountLinkBuilder('Google', 'assets/icon/Google_logo.png'),
            const SizedBox(height: 15),

            //Apple
            accountLinkBuilder('Apple', isLightMode? 'assets/icon/Apple_black_logo.png': 'assets/icon/Apple_white_logo.png'),
            const SizedBox(height: 15),

            //Facebook
            accountLinkBuilder('Facebook', 'assets/icon/FB_logo.png'),
            const SizedBox(height: 15),

            //Twitter
            accountLinkBuilder('Twitter', 'assets/icon/Twitter_logo.png'),
            
          ],
        ),
      ),
    );
  }

  Widget accountLinkBuilder(String platform, String iconUrl){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(iconUrl, width: 50, height: 50),
                const SizedBox(width: 10),
                Text(platform, style: heading6Bold.copyWith(fontSize: 15)),
              ],
            ),
            TextButton(
              onPressed: () => _toggleConnection(platform), 
              child: Text(
                _isConnected[platform]! ? 'Connected': 'Connect', 
                style: bodyXLBold.copyWith(fontSize: 15, color: _isConnected[platform]! ? Theme.of(context).colorScheme.primary:primaryOrange.shade900),
              ),
            ),
          ],
        ),
      ),
    );
  }

}