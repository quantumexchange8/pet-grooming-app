import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo/paw_small.png'),
        title: Text('Messages', style: heading4Bold),
        centerTitle: true,
        actions: [ 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(IconlyLight.search, size: 25),
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 30)
          ),
        ],
      ),
    );
  }
}