import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';


class ProfileDetailSelection extends StatelessWidget {
  final String topic;
  final VoidCallback onPress;
  
  const ProfileDetailSelection({
    super.key,
    required this.topic,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(context.tr(topic), style: heading6Bold),
      trailing: const Icon(IconlyLight.arrow_right_2, size:20),
    );
  }
}