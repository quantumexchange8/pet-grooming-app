import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
//import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguagePage extends StatefulWidget {
  const AppLanguagePage({super.key});

  @override
  State<AppLanguagePage> createState() => _AppLanguagePageState();
}

class _AppLanguagePageState extends State<AppLanguagePage> {
  Locale selectedLocale = const Locale('en', 'US');

  @override
  void initState(){
    super.initState();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('languageCode') ?? 'en';
    final countryCode = prefs.getString('countryCode') ?? 'US';

    setState(() {
      selectedLocale = Locale(languageCode, countryCode);
      context.setLocale(selectedLocale);
    });
  }

  Future<void> _saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: Text(context.tr('App Language'), style: heading4Bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              buildLanguageButton(context, Locale('en','US'), 'English (US)', 'assets/flags/usa.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('en','UK'), 'English (UK)', 'assets/flags/uk.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('zh','CN'), 'Mandarin', 'assets/flags/china.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('es','ES'), 'Spanish', 'assets/flags/spain.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('hi','IN'), 'Hindi', 'assets/flags/india.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('fr','FR'), 'French', 'assets/flags/france.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('ar','AR'), 'Arabic', 'assets/flags/uae.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('ru','RU'), 'Russian', 'assets/flags/russia.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('ja','JP'), 'Japanese', 'assets/flags/jp.png'),
              const SizedBox(height: 10),
              buildLanguageButton(context, Locale('ko','KR'), 'Korean', 'assets/flags/korea.png'),
          
            ],
          ),
        ),
      ),


    );
  }

  Widget buildLanguageButton(
    BuildContext context,
    Locale locale,
    String language,
    String flagPath,
  ){
    bool isSelected = selectedLocale == locale;
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSelected? primaryOrange.shade900:Colors.transparent,
              width: 2,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onTertiary,
        ),
      ),
      
      onPressed: (){
        setState(() {
          selectedLocale = locale;
          context.setLocale(locale);
          _saveLocale(locale);
        });
      }, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                flagPath, width: 60, height: 40,
              ),
              const SizedBox(width: 10),
              Text(context.tr(language), style: heading6Semibold),
            ],
          ),
          if(isSelected)
            Icon(Icons.check, color: primaryOrange.shade900),
        ],
      )
    );



  }


}