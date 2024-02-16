part of 'app.dart';

const int _backgroundColorLight =  0xFF214ECC;
const int _backgroundColorDark =  0xFF0C1D4D;

TextTheme _textTheme = TextTheme(
  displayLarge: GoogleFonts.inter().copyWith(fontSize: 57),
  displayMedium: GoogleFonts.inter().copyWith(fontSize: 45),
  displaySmall: GoogleFonts.inter().copyWith(fontSize: 36),
  headlineLarge: GoogleFonts.inter().copyWith(fontSize: 32),
  headlineMedium: GoogleFonts.inter().copyWith(fontSize: 28),
  headlineSmall: GoogleFonts.inter().copyWith(fontSize: 24),
  titleLarge: GoogleFonts.inter().copyWith(fontSize: 22),
  titleMedium: GoogleFonts.inter().copyWith(fontSize: 16, letterSpacing: 0.15),
  titleSmall: GoogleFonts.inter().copyWith(fontSize: 14, letterSpacing: 0.1),
  labelLarge: GoogleFonts.roboto().copyWith(fontSize: 14, letterSpacing: 0.1),
  labelMedium: GoogleFonts.roboto().copyWith(fontSize: 12, letterSpacing: 0.5),
  labelSmall: GoogleFonts.roboto().copyWith(fontSize: 11, letterSpacing: 0.5),
);

ThemeData _lightTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: Colors.transparent,
    tertiaryContainer: Color(_backgroundColorDark),
    secondaryContainer: Color(_backgroundColorLight),
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
);

ThemeData _darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: Colors.transparent,
    tertiaryContainer: Colors.black,
    secondaryContainer: Colors.black,
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
);
