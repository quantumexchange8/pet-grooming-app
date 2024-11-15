import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo/paw_small.png'),
        title: Text('Maps', style: heading4Bold),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(IconlyLight.search),
          ),
        ],
      ),

    body: Column(
      children: [

      ],
    ),
    );
  }
}