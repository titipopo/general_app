import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF121212),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFBB86FC),
      onPrimary: Color(0xFF000000),
      secondary: Color(0xFF03DAB6),
      onSecondary: Color(0xFF000000),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      background: Color(0xFF121212),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFFFFFFF),
      outline: Color(0xFFFFD700),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFE0E0E0),
      size: 25.0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFE0E0E0),
      unselectedItemColor: Color(0XFFB0B0B0),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      elevation: MaterialStatePropertyAll(0.0),
      textStyle: MaterialStatePropertyAll(TextStyle(
        color: Color(0xFFE0E0E0),
      )),
      foregroundColor: MaterialStatePropertyAll(
        Color(0xFFE0E0E0),
      ),
      iconColor: MaterialStatePropertyAll(Color(0xFFE0E0E0)),
      backgroundColor: MaterialStatePropertyAll(Color(0xFF1E1E1E)),
    )),
    radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(Colors.orange),
        overlayColor: MaterialStatePropertyAll(Colors.red)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(width: 2, color: Color(0xFFCF6679)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(width: 2, color: Color(0xFFCF6679)),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      displayMedium: TextStyle(
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      displaySmall: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      headlineMedium: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      headlineSmall: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE0E0E0),
      ),
      titleSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE0E0E0),
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE0E0E0),
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE0E0E0),
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE0E0E0),
      ),
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      labelMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE0E0E0),
      ),
      labelSmall: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: Color(0xFFE0E0E0),
      ),
    ),
  );

  static final lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(0xFFFAFAFA),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF6200EE),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF03DAC6),
        onSecondary: Color(0xFF000000),
        error: Color(0xFFB00020),
        onError: Color(0xFFFFFFFF),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF000000),
        surface: Color(0xFFF2F2F2),
        onSurface: Color(0xFF000000),
        outline: Color(0xFFFFD700),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFE0E0E0),
        size: 25.0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF2F2F2),
        selectedItemColor: Color(0xFFE0E0E0),
        unselectedItemColor: Color(0XFFB0B0B0),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        elevation: MaterialStatePropertyAll(0.0),
        textStyle: MaterialStatePropertyAll(TextStyle(
          color: Color(0xFF212121),
        )),
        foregroundColor: MaterialStatePropertyAll(
          Color(0xFF212121),
        ),
        iconColor: MaterialStatePropertyAll(Color(0xFF212121)),
        backgroundColor: MaterialStatePropertyAll(Color(0xFFF2F2F2)),
      )),
      radioTheme: const RadioThemeData(
          fillColor: MaterialStatePropertyAll(Colors.orange),
          overlayColor: MaterialStatePropertyAll(Colors.red)),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        displayMedium: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        displaySmall: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        headlineLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        headlineMedium: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        headlineSmall: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        titleLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF212121),
        ),
        titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF212121),
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF212121),
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF212121),
        ),
        bodySmall: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF212121),
        ),
        labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        labelMedium: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        labelSmall: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF212121),
        ),
      ));
}
