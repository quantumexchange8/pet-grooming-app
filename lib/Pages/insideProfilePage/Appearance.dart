import 'package:adoptify/Pages/insideProfilePage/SidePages/AppLanguagePage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/theme/themes_provider.dart';
import 'package:adoptify/widgets/ProfileDetailSelection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

enum ThemeModeOption { system, light, dark }

class AppearancePage extends StatefulWidget {
  const AppearancePage({Key? key}) : super(key: key);

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  ThemeModeOption _themeModeOption = ThemeModeOption.system;
  ThemeModeOption _selectedOption = ThemeModeOption.system;
  Locale? _currentLocale;

  @override
  void initState(){
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _selectedOption = _getThemeModeOption(themeProvider.themeMode);
    //_currentLocale = context.locale;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _currentLocale ??= context.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        _themeModeOption = _getThemeModeOption(themeProvider.themeMode);

        return Scaffold(
          appBar: AppBar(
            title: Text('App Appearance', style: heading4Bold),
            centerTitle: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,

          body: Column(
            children: [

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Theme', style: heading6Bold),
                    Text(_getThemeSelection(_selectedOption), style: bodyXLSemibold.copyWith(color: Theme.of(context).colorScheme.primary, fontSize:16)),
                  ],
                ),
                
                trailing: const Icon(IconlyLight.arrow_right_2, size:20),
                onTap: (){
                    showModalBottomSheet<void>(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return SizedBox(
                            height: 320,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  Text('Choose Theme', style: heading6Bold),
                                  Divider(thickness: 1, color: grey.shade300, height: 15.0),
                                  RadioListTile<ThemeModeOption>(
                                    title: Text('System Default', style: heading6Regular),
                                    value: ThemeModeOption.system,
                                    groupValue: _selectedOption,
                                    fillColor: MaterialStateColor.resolveWith((states) => primaryOrange.shade900),
                                    activeColor: primaryOrange.shade900,
                                    onChanged: (ThemeModeOption? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                  RadioListTile<ThemeModeOption>(
                                    title: Text('Light', style: heading6Regular),
                                    value: ThemeModeOption.light,
                                    groupValue: _selectedOption,
                                    fillColor: MaterialStateColor.resolveWith((states) => primaryOrange.shade900),
                                    activeColor: primaryOrange.shade900,
                                    onChanged: (ThemeModeOption? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                  RadioListTile<ThemeModeOption>(
                                    title: Text('Dark', style: heading6Regular),
                                    value: ThemeModeOption.dark,
                                    groupValue: _selectedOption,
                                    fillColor: MaterialStateColor.resolveWith((states) => primaryOrange.shade900),
                                    activeColor: primaryOrange.shade900,
                                    onChanged: (ThemeModeOption? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                  Divider(thickness: 1, color: grey.shade300, height: 20.0),
                                  
                                  //For button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: LightOrangeButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          text: 'Cancel',
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: OrangeButton(
                                          onPressed: () {
                                            _setThemeMode(_selectedOption, themeProvider);
                                            Navigator.pop(context);
                                          },
                                          text: 'OK',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('App Language', style: heading6Bold),
                    Text(_getCurrentLanguage(), style: bodyXLSemibold.copyWith(color: Theme.of(context).colorScheme.primary, fontSize:16)),
                  ],
                ),
                trailing: const Icon(IconlyLight.arrow_right_2, size:20),
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> const AppLanguagePage(),
                    ),
                  ).then((_){
                    setState(() {
                      _currentLocale = context.locale;
                    });
                  });
                },
              ),

            ],
          ),
        );
      },
    );
  }

  ThemeModeOption _getThemeModeOption(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return ThemeModeOption.light;
      case ThemeMode.dark:
        return ThemeModeOption.dark;
      default:
        return ThemeModeOption.system;
    }
  }

  void _setThemeMode(ThemeModeOption option, ThemeProvider themeProvider) {
    switch (option) {
      case ThemeModeOption.light:
        themeProvider.setThemeMode(ThemeMode.light);
        break;
      case ThemeModeOption.dark:
        themeProvider.setThemeMode(ThemeMode.dark);
        break;
      default:
        themeProvider.setThemeMode(ThemeMode.system);
        break;
    }
  }

  String _getThemeSelection(ThemeModeOption option){
    switch(option){
      case ThemeModeOption.system:
       return 'System Default';

      case ThemeModeOption.light:
       return 'Light';

      case ThemeModeOption.dark:
       return 'Dark';

      default:
        return 'System Default';
    }
  }

  String _getCurrentLanguage(){
    switch(_currentLocale.toString()){
      case 'en_US':
       return 'English (US)';
      case 'en_UK':
       return 'English (UK)';
      case 'zh_CN':
       return 'Mandarin';
      case 'es_ES':
       return 'Spanish';
      case 'hi_IN':
       return 'Hindi';
      case 'fr_FR':
       return 'France';
      case 'ar_AR':
       return 'Arabic';
      case 'ru_RU':
       return 'Russian';
      case 'ja_JP':
       return 'Japanese';
      default:
       return 'English (US)';

    }
  }

}
