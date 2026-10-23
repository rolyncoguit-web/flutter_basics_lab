import 'package:flutter/material.dart';

const String studentName = 'Rolyn D. Coguit';
const String studentId = '241-00855';

const Color latteCream = Color(0xFFF7F0E6);
const Color oatBeige = Color(0xFFDCC7AA);
const Color caramel = Color(0xFFA47551);
const Color mochaBrown = Color(0xFF6F4E37);
const Color espresso = Color(0xFF3E2C23);

Color get studentColor => mochaBrown;
String get studentColorName => 'Mocha Brown';

ThemeData buildStudentTheme({Brightness brightness = Brightness.light}) {
  final bool isDark = brightness == Brightness.dark;

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: mochaBrown,
      brightness: brightness,
    ),
    scaffoldBackgroundColor: isDark ? espresso : latteCream,
    appBarTheme: AppBarTheme(
      backgroundColor: isDark ? espresso : mochaBrown,
      foregroundColor: latteCream,
      elevation: 0,
    ),
  );
}
