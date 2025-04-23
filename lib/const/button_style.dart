import 'package:adoptify/const/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrangeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const OrangeButton({super.key,
  required this.onPressed,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => primaryOrange.shade900),
        fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
      ),
      child: Text(
        context.tr(text), 
        style: TextStyle(
          fontFamily: GoogleFonts.urbanist().fontFamily,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class LightOrangeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  
  const LightOrangeButton({super.key,
  required this.onPressed,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current theme's brightness
    final isLightMode = Theme.of(context).brightness == Brightness.light;
  
    // Set text color based on the brightness
    final textColor = isLightMode ? primaryOrange.shade900 : Colors.white;

    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.tertiary),
        fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
      ),
      child: Text(context.tr(text), 
        style: TextStyle(
          color: textColor, 
          fontFamily: GoogleFonts.urbanist().fontFamily,
          fontWeight: FontWeight.bold),
        ),
    );
  }
}


class GreyOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconUrl;
  final String text;
  
  const GreyOutlineButton({super.key,
  required this.onPressed,
  required this.iconUrl,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: grey.shade100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage(iconUrl)),
          const Spacer(),
          Center(
            child: Text(context.tr(text), textAlign: TextAlign.center)
          ),
          const Spacer(),
        ],
      ),
    );
  }
}