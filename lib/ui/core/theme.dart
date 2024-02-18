part of '../app.dart';

const int _backgroundColorLight = 0xFF214ECC;
const int _backgroundColorDark = 0xFF0C1D4D;
const int _orange = 0xFFFFC629;
const int _error = 0xFFFF7E7E;

TextTheme _textTheme = TextTheme(
  displayLarge: GoogleFonts.inter().copyWith(fontSize: 57),
  displayMedium: GoogleFonts.inter().copyWith(fontSize: 45),
  displaySmall: GoogleFonts.inter().copyWith(fontSize: 36),
  headlineLarge: GoogleFonts.inter()
      .copyWith(fontSize: 32, fontWeight: FontWeight.bold, height: 40),
  headlineMedium:
      GoogleFonts.inter().copyWith(fontSize: 28, fontWeight: FontWeight.bold),
  headlineSmall:
      GoogleFonts.inter().copyWith(fontSize: 24, fontWeight: FontWeight.bold),
  titleLarge: GoogleFonts.inter().copyWith(fontSize: 22),
  titleMedium:
      GoogleFonts.inter().copyWith(fontSize: 16, fontWeight: FontWeight.w600),
  titleSmall: GoogleFonts.inter().copyWith(fontSize: 14),
  bodyLarge: GoogleFonts.inter().copyWith(fontSize: 16),
  bodyMedium: GoogleFonts.inter().copyWith(fontSize: 14),
  bodySmall: GoogleFonts.inter().copyWith(fontSize: 12),
  labelLarge: GoogleFonts.roboto().copyWith(fontSize: 14),
  labelMedium: GoogleFonts.roboto().copyWith(fontSize: 12),
  labelSmall: GoogleFonts.roboto().copyWith(fontSize: 11),
);

ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: Colors.transparent,
    secondaryContainer: Colors.white.withOpacity(0.16),
    tertiaryContainer: const Color(_backgroundColorDark),
    onTertiaryContainer: const Color(_backgroundColorLight),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
    outline: const Color(_orange),
    error: const Color(_error),
  ),
  canvasColor: Colors.transparent,
  brightness: Brightness.dark,
  textTheme: _textTheme,
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(_backgroundColorDark),
      )),
  elevatedButtonTheme: _elevatedButtonTheme,
);

ThemeData _darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: Colors.transparent,
    secondaryContainer: Colors.white.withOpacity(0.16),
    tertiaryContainer: Colors.black,
    onTertiaryContainer: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
    outline: const Color(_orange),
    error: const Color(_error),
  ),
  canvasColor: Colors.transparent,
  brightness: Brightness.dark,
  textTheme: _textTheme,
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      )),
  elevatedButtonTheme: _elevatedButtonTheme,
);

var _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    primary: Colors.white.withOpacity(0.16),
    onPrimary: Colors.white,
    foregroundColor: Colors.white.withOpacity(0.16),
    backgroundColor: Colors.white.withOpacity(0.16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
);
