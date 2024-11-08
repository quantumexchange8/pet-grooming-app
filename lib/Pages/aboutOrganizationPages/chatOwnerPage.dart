import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChatOwnerPage extends StatefulWidget {
  const ChatOwnerPage({super.key});

  @override
  State<ChatOwnerPage> createState() => _ChatOwnerPageState();
}

class _ChatOwnerPageState extends State<ChatOwnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Pet Owner Name', style: heading4Bold), // make it ecllips
        centerTitle: true,
        actions: [
          IconButton( 
            onPressed: (){},
            icon: Icon(IconlyLight.video, size: 25),
            
          ), 

          IconButton(
            onPressed: (){}, 
            icon: Icon(IconlyLight.call, size: 25)
          ),

        ],
      ),
    );
  }
}