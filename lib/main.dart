import 'package:adoptify/controllers/favourite_controller.dart';
import 'package:adoptify/Pages/onBoardingPages/boarding_screen.dart';
import 'package:adoptify/controllers/pet_photo_slider.dart';
import 'package:adoptify/theme/themes.dart';
import 'package:adoptify/theme/themes_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //GetX
  Get.put(PetPhotoSlider());

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en','US'),
        Locale('es','ES'),
        Locale('ja','JP'),
        Locale('ar','AR'),
        Locale('zh','CN'),
        Locale('en','UK'),
        Locale('fr','FR'),
        Locale('hi','IN'),
        Locale('ru','RU'),
        Locale('ko','KR'),
      ], 
      path: 'assets/languages',
      fallbackLocale: const Locale('en','US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteController()),
        ],
        child: const MyApp(),
      ),
    ),
   
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Pet Grooming App',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeProvider.themeMode,
      localizationsDelegates: [
        
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context)!.delegate,
        //...context.localizationDelegates,
      ],
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,//context.supportedLocales,
      locale: EasyLocalization.of(context)!.locale,//context.locale,
      home: const BoardingScreen(),
    );
  }
}

