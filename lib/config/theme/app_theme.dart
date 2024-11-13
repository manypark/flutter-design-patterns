import 'package:flutter/material.dart';

class AppTheme {
  
  ThemeData getTheme({Color? colorSeed}) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Lato',
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorSeed ?? Colors.amberAccent,
    ),
  );

}
