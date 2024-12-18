import 'dart:io';

import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/widgets/bottomNaviBar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:editable_image/editable_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';

class FinalStepUserInfo extends StatefulWidget {
  const FinalStepUserInfo({super.key});

  @override
  State<FinalStepUserInfo> createState() => _FinalStepUserInfoState();
}

class _FinalStepUserInfoState extends State<FinalStepUserInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  // bool _isNameFilled = false;
  // bool _isPhoneNoFilled = false;
  
  String? selectedGender = 'Male';
  File? _profilePicFile;

  void _uploadImage(File? file) async {
    if(file == null) return;

    setState(() {
      _profilePicFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {

    final genderList = [context.tr('Male'), context.tr('Female')];


    return Scaffold(
      appBar: AppBar(
      title: Container(
        height: 10, 
        decoration: BoxDecoration(
          color: grey.shade200,
          borderRadius: BorderRadius.circular(15), 
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15), 
          child: LinearProgressIndicator(
            value: 1.0, // Set to 1.0 for a fully filled bar (4/4 steps completed)
            valueColor: AlwaysStoppedAnimation<Color>(primaryOrange.shade900),
            backgroundColor: Colors.transparent, 
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('4 / 4', style: heading6Bold),
        ),
      ],
    ),
      /* appBar: AppBar(
        title: StepProgressIndicator(
          totalSteps: 4,
          currentStep: 4,
          size: 10,
          padding: 0,
          selectedColor: primaryOrange.shade900,
          unselectedColor: grey.shade200,
          roundedEdges: const Radius.circular(15),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('4 / 4',style:heading6Bold),
          ),
        ],
      ), */

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.tr('Final Steps!'), style: heading3Bold),
                    const SizedBox(height: 10),
                    Text(context.tr('We\'re almost there! Fill in your personal details to create a profile and start your journey towards a furry friendship.'),style: bodyXLRegular),
                    const SizedBox(height: 30),

              //profile photo
                    Center(
                      child: EditableImage(
                        // Define the method that will run on the change process of the image.
                        onChange: (file) => _uploadImage(file),
                      
                        // Define the source of the image.
                        image: _profilePicFile != null
                            ? Image.file(_profilePicFile!, fit: BoxFit.cover)
                            : null,
                      
                        // Define the size of EditableImage.
                        size: 100.0,
                        editIconColor: Colors.white,
                        editIconBackgroundColor: primaryOrange.shade800,
                        imageDefaultColor: primaryOrange.shade800, 
                      
                        // Define the border of the image.
                        imageBorder: Border.all(color: primaryOrange.shade200, width: 2.0),
                      
                        // Define the border of the icon.
                        editIconBorder: Border.all(color: primaryOrange.shade800, width: 2.0),
                        
                        ),
                        
                    ),
                    const SizedBox(height: 30),

              //name
                    Text(context.tr('Full Name'), style: heading6Bold),
                    const SizedBox(height: 5),
                    TextField(
                      /* onChanged: (value){
                        setState(() {
                          _isNameFilled = nameController.text.isEmpty;
                        });
                      }, */
                      controller: nameController,
                      style: bodyXLSemibold,
                      decoration: InputDecoration(
                        hintText: 'Andrew Ainsley',
                        hintStyle: bodyLRegular.copyWith(color: grey.shade500),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.secondary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 30),

              //phone no
                    Text(context.tr('Phone Number'), style: heading6Bold),
                    const SizedBox(height: 5),
                    TextField(
                      /* onChanged: (value){
                        setState(() {
                          _isPhoneNoFilled = phoneNoController.text.isEmpty;
                        });
                      }, */
                      controller: phoneNoController,
                      style: bodyXLSemibold,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: CountryCodePicker(
                            onChanged: (country){
                              print('Country code selected: ${country.dialCode}');
                            },
                            initialSelection: 'US',
                            showFlag: true,
                            showDropDownButton: true,
                            padding: EdgeInsets.zero,
                            showOnlyCountryWhenClosed: false,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

              //gender
                    Text(context.tr('Gender'), style: heading6Bold),
                    const SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down, size: 25),
                      items: genderList.map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e, style: bodyXLSemibold))).toList(), 
                      onChanged: (String? gender){
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                      value: selectedGender == 'Male'
                          ? context.tr('Male')
                          : context.tr('Female'),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
         

          //button
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              child: Row(
                children: [
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=> const BottomNaviBar(),
                          ),
                        );
                      }, 
                      text: 'Continue',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}