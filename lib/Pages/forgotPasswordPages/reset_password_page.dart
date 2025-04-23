import 'package:adoptify/const/button_style.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:adoptify/Pages/forgotPasswordPages/all_set_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';


class EditNewPassword extends StatefulWidget {
  const EditNewPassword({super.key});

  @override
  State<EditNewPassword> createState() => _EditNewPasswordState();
}

class _EditNewPasswordState extends State<EditNewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isVisible = false;
  bool _isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(context.tr('Secure Your Account'), style: heading3Bold, overflow: TextOverflow.ellipsis, maxLines: 2),
                      ),
                      const SizedBox(width: 5),
                      Image.asset('assets/image/lock.png'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(context.tr('Almost there! Create a new password for your Adoptify account to keep it secure. Remember to choose a strong and unique password.'),style: bodyXLRegular),
                  const SizedBox(height: 35),
                  Text(context.tr('New Password'), style: heading6Bold, textAlign: TextAlign.start),
                  const SizedBox(height: 10),
                  TextField(
                    //onChanged:,
                    controller: passwordController,
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,                
                      ),
                      isDense: true,
                      hintText: context.tr('New Password'),
                      hintStyle: bodyLRegular,
                      prefixIcon: const Icon(IconlyLight.lock),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible? const Icon(IconlyLight.show):const Icon(IconlyLight.hide),
                      ),
                    ),
                  ),
                    const SizedBox(height: 15),
                  Text(context.tr('Confirm New Password'), style: heading6Bold, textAlign: TextAlign.start,),
                  const SizedBox(height: 10),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: !_isVisible2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,                
                      ),
                      isDense: true,
                      hintText: context.tr('Confirm New Password'),
                      hintStyle: bodyLRegular,
                      prefixIcon: const Icon(IconlyLight.lock),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isVisible2 = !_isVisible2;
                          });
                        },
                        icon: _isVisible2? const Icon(IconlyLight.show): const Icon(IconlyLight.hide),
                      ),
                    ),
                  ),
                
                ],
                
              ),
              
            ),
          ),

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
                          MaterialPageRoute(builder: ((context) => const AllSet()),
                          ),
                        );
                      }, 
                      text: 'Save New Password'
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}