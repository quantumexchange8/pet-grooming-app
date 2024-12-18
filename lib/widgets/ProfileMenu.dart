import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';


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
      title: Text(context.tr(topic), style: heading6Bold),
      trailing: const Icon(IconlyLight.arrow_right_2, size:20),
    );
  }
}