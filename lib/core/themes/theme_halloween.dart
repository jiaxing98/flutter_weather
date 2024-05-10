import 'package:flutter/material.dart';

class HalloweenTheme {
  static const lightOrange = Color(0xffffe0b2);
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: Colors.orange,
      secondary: lightOrange,
      primaryContainer: Colors.orange,
    ),
    scaffoldBackgroundColor: lightOrange,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.orange,
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.orange),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(Colors.black),
      trackColor: MaterialStateProperty.all<Color>(lightOrange),
      trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    listTileTheme: ListTileThemeData(
      selectedColor: Colors.black,
      textColor: Colors.grey.shade700,
    ),
  );

  static const blackGrey = Color(0xff1d1e22);
  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: blackGrey,
    ),
    scaffoldBackgroundColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: blackGrey,
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
      trackColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
      trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      selectedColor: Colors.white,
      textColor: Colors.grey,
    ),
  );
}
