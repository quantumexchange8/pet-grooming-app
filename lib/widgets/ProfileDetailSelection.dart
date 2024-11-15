import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      title: Text(topic, style: heading6Bold),
      trailing: const Icon(IconlyLight.arrow_right_2, size:20),
    );
  }
}