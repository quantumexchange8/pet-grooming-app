import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo/paw_small.png'),
        title: Text(context.tr('Favorites'), style: heading4Bold),
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

      body: Column(
        children: [

        ],
      ),
    );
  }
}