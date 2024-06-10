import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String topic;
  final VoidCallback onPress;
  
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.topic,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading:Icon(icon),
      title: Text(topic, style: heading6Bold),
      trailing: const Icon(Iconsax.arrow_right_34, size:15),
    );
  }
}