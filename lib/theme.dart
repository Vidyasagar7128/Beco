import 'package:flutter/material.dart';

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const IconThemeData iconTheme = IconThemeData(color: shrinePink400);
const TextTheme textTheme = TextTheme(
  bodyMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0XFF41644A)), //for Text('data')
  bodySmall: TextStyle(
    overflow: TextOverflow.ellipsis,
  ),
  bodyLarge: TextStyle(
    overflow: TextOverflow.ellipsis,
  ),
  headlineLarge: TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    color: Color(0XFF41644A),
  ),
  titleLarge: TextStyle(overflow: TextOverflow.ellipsis),
  titleMedium: TextStyle(
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.normal,
    color: Color(0XFF212A3E),
  ),
  labelMedium: TextStyle(
    fontSize: 20.0,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.normal,
  ),
  labelSmall: TextStyle(
    fontSize: 16.0,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.normal,
  ),
);

const TextTheme darkTextTheme = TextTheme(
  bodyMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Color(0XFFA0D8B3)), //for Text('data')
  bodySmall: TextStyle(
    overflow: TextOverflow.ellipsis,
  ),
  bodyLarge: TextStyle(
    overflow: TextOverflow.ellipsis,
  ),
  headlineLarge: TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    color: Color(0XFFA0D8B3),
  ),
  titleLarge: TextStyle(overflow: TextOverflow.ellipsis),
  titleMedium: TextStyle(
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.normal,
    color: Color(0XFFA0D8B3),
  ),
  labelMedium: TextStyle(
    fontSize: 20.0,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.normal,
  ),
  labelSmall: TextStyle(
    fontSize: 16.0,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.normal,
  ),
);

ButtonTextTheme buttonTextTheme = ButtonTextTheme.accent;
ColorScheme lightColorScheme = const ColorScheme(
  primary: Color(0XFFA0D8B3),
  secondary: Color(0XFFAAC8A7),
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: Color(0XFFAAC8A7),
  onSurface: Color(0XFF2C3333),
  onBackground: Color(0XFFAAC8A7),
  onError: Colors.red,
  brightness: Brightness.light,
);
///////////////////////////////////
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: const ColorScheme(
    primary: Color(0XFFA0D8B3),
    secondary: Color(0XFFA0D8B3),
    surface: Color(0XFF181823),
    background: Color(0XFF181823),
    error: Color(0XFFA0D8B3),
    onPrimary: Color(0XFFA0D8B3),
    onSecondary: Color(0XFFA0D8B3),
    onSurface: Color(0XFFA0D8B3),
    onBackground: Color(0XFF181823),
    onError: Colors.red,
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: Color(0XFFA0D8B3)),
  textTheme: darkTextTheme,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0XFFA0D8B3)),
      iconColor: MaterialStateProperty.all<Color>(Colors.white),
      textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white)),
    ),
  ),
);

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.green,
    primaryColor: const Color(0XFFA0D8B3),
    colorScheme: lightColorScheme,
    iconTheme: const IconThemeData(color: Color(0XFF41644A)),
    textTheme: textTheme,
    cardTheme: const CardTheme(color: Color(0XFFF1F6F9)),
    listTileTheme: const ListTileThemeData(iconColor: Color(0XFF41644A)),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0XFF41644A),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0XFF41644A)),
        iconColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white)),
      ),
    ),
    sliderTheme: SliderThemeData(
      valueIndicatorColor: Colors.green,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayColor: Colors.red.withAlpha(32),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.always,
    ));
