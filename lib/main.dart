// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    FlutterCakeShopUI(),
  );
}

class FlutterCakeShopUI extends StatefulWidget {
  const FlutterCakeShopUI({super.key});

  @override
  State<FlutterCakeShopUI> createState() => _FlutterCakeShopUIState();
}

class _FlutterCakeShopUIState extends State<FlutterCakeShopUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: GoogleFonts.kanit().fontFamily,
          fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
        ),
      ),
    );
  }
}