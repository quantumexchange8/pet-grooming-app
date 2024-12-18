import 'dart:io';

import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:editable_image/editable_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _profilePicFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  //TextEditingController bdController = TextEditingController();
  
  String? selectedGender = 'Male';
  DateTime? selectedDate;

  void _uploadImage(File? file)async{
    if(file == null) return;

    setState(() {
      _profilePicFile = file;
    });
  }

  void onDateChanged(DateTime newDate){
    setState(() {
      selectedDate = newDate;
    });
  }


  @override
  Widget build(BuildContext context) {

    final gender = [context.tr('Male'), context.tr('Female')];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('My Profile'), style: heading4Bold),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 25),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              //profile picture
              Center(
                child: EditableImage(
                  onChange: (file)=> _uploadImage(file), 
                  image: _profilePicFile != null ? Image.file(_profilePicFile!, fit: BoxFit.cover): null,
                  size: 100.0,
                  editIconColor: Colors.white,
                  editIconBackgroundColor: primaryOrange.shade800,
                  imageBorder: Border.all(color: primaryOrange.shade200, width: 2.0),
                  imageDefaultColor: primaryOrange.shade800, 
                  
                ),
              ),

             
              //full name
              const SizedBox(height: 20),
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
          
              //email
              const SizedBox(height: 20),
              Text(context.tr('Email'), style: heading6Bold),
                const SizedBox(height: 5),
                TextField(
                  /* onChanged: (value){
                    setState(() {
                      _isNameFilled = nameController.text.isEmpty;
                    });
                  }, */
                  controller: emailController,
                  style: bodyXLSemibold,
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
                    hintStyle: bodyLRegular.copyWith(color: grey.shade500),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    prefixIcon: const Icon(IconlyLight.message, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true,
                  ),
                ),

              //phone no
              const SizedBox(height: 20),
              Text(context.tr('Phone Number'), style: heading6Bold),
              const SizedBox(height: 5),
              TextField(
                /* onChanged: (value){
                  setState(() {
                    _isNameFilled = nameController.text.isEmpty;
                  });
                }, */
                controller: phoneNoController,
                style: bodyXLSemibold,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                ),
              ),

              //gender
              const SizedBox(height: 20),
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
                  items: gender.map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e, style: bodyXLSemibold))).toList(), 
                  onChanged: (String? gender){
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                  value: selectedGender == 'Male'? 
                          context.tr('Male'): context.tr('Female'),
                ),

              //birthday
              const SizedBox(height: 20),
              Text(context.tr('Birthdate'), style: heading6Bold),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                  hintText: '1/1/2000',
                  hintStyle: bodyLRegular.copyWith(color: grey.shade500),
                  suffixIcon: IconButton(
                    icon: const Icon(IconlyLight.calendar, size: 20),
                    onPressed: (){
                      showDatePicker(
                        context: context, 
                        firstDate: DateTime(1900), 
                        lastDate: DateTime(2025),
                      ).then((newDate) {
                        if(newDate != null){
                          onDateChanged(newDate);
                        }
                      });
                    },
                  ),
                ),
                readOnly: true,
                style: bodyXLSemibold,
                controller: TextEditingController(
                  text: selectedDate != null ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}":'',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}