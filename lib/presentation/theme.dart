import 'package:flutter/material.dart';
import 'colors.dart';

class LoopTheme {
  static final ThemeData lightTheme = _buildLightTheme();
  static final ThemeData darkTheme = _buildDarkTheme();
  static final ThemeData midnightTheme = _buildMidnightTheme();

  static ThemeData _buildLightTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: ColorThemes.light.primary,
      errorColor: ColorThemes.light.alerts,
      backgroundColor: ColorThemes.light.onBackground,
      scaffoldBackgroundColor: ColorThemes.light.background,
      dividerColor: ColorThemes.light.stroke,
      colorScheme: base.colorScheme.copyWith(
        primary: ColorThemes.light.primary,
      ),
      textTheme: base.textTheme.apply(fontFamily: 'Assistant'),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: ColorThemes.light.primary,
              maximumSize: const Size(100, 40))),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: ColorThemes.light.onBackground,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorThemes.light.secondaryFont,
        ),
        actionsIconTheme: IconThemeData(
          color: ColorThemes.light.secondaryFont,
        ),
      ),
    );
  }

  static ThemeData _buildMidnightTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: ColorThemes.midnight.primary,
      errorColor: ColorThemes.midnight.alerts,
      backgroundColor: ColorThemes.midnight.background,
      scaffoldBackgroundColor: ColorThemes.midnight.background,
      dividerColor: ColorThemes.midnight.secondaryFont,
      colorScheme: base.colorScheme.copyWith(
        primary: ColorThemes.midnight.primary,
      ),
      textTheme: base.textTheme.apply(
          fontFamily: 'Assistant',
          displayColor: ColorThemes.midnight.primaryFont),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: ColorThemes.midnight.primary,
              maximumSize: const Size(100, 40))),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        backgroundColor: ColorThemes.midnight.onBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorThemes.midnight.secondaryFont),
        actionsIconTheme:
            IconThemeData(color: ColorThemes.midnight.secondaryFont),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    final base = ThemeData.dark();
    return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: ColorThemes.dark.primary,
      errorColor: ColorThemes.dark.alerts,
      backgroundColor: ColorThemes.dark.onBackground,
      scaffoldBackgroundColor: ColorThemes.dark.background,
      dividerColor: ColorThemes.dark.stroke,
      colorScheme: base.colorScheme.copyWith(
        primary: ColorThemes.dark.primary,
      ),
      textTheme: base.textTheme.apply(fontFamily: 'Assistant'),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: ColorThemes.dark.primary,
              maximumSize: const Size(100, 40))),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: ColorThemes.dark.onBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorThemes.dark.secondaryFont),
        actionsIconTheme: IconThemeData(color: ColorThemes.dark.secondaryFont),
      ),
    );
  }
}

enum ThemeType { light, dark, midnight }
const Map<String, ThemeType> themes = {
  'midnight': ThemeType.midnight,
  'dark': ThemeType.dark,
  'light': ThemeType.light,
};

class ThemeNotifier extends ChangeNotifier {
  var selectedIndex = 0;
  var _userTheme = ThemeType.midnight;
  ThemeData get theme {
    switch (_userTheme) {
      case ThemeType.light:
        return LoopTheme.lightTheme;
      case ThemeType.dark:
        return LoopTheme.darkTheme;
      case ThemeType.midnight:
      default:
        return LoopTheme.midnightTheme;
    }
  }

  void handleThemeSelected(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;

      switch (index) {
        case 0:
          _userTheme = ThemeType.midnight;
          break;
        case 1:
          _userTheme = ThemeType.dark;
          break;
        case 2:
          _userTheme = ThemeType.light;
          break;
        default:
          _userTheme = ThemeType.midnight;
      }

      notifyListeners();

      _saveToPrefs();
    }
  }

  final String key = "theme";
  // late SharedPreferences _prefs;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  toggleTheme() {
    _saveToPrefs();
    notifyListeners();
  }

  void _initPrefs() async {
    // if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  void _loadFromPrefs() async {
    await _initPrefs;
    // final _theme = _prefs.getString(key);

    // _userTheme =
    //     ThemeType.values.firstWhereOrNull((t) => t.toString() == _theme) ??
    //         _userTheme;

    notifyListeners();
  }

  void _saveToPrefs() async {
    // await _initPrefs;
    // await _prefs.setString(key, _userTheme.toString());
  }
}
