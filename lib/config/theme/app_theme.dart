import 'package:flutter/material.dart';

class AppTheme {
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
    ),
  );

}
