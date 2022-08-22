import 'package:awake_life/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:awake_life/utils/util_export.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeProvider() {
    _getThemeLocal();
  }

  _getThemeLocal() async {
    final isDarkMode = PrefsUtil.getBool(PrefsCache.THEME_APP);

    if (isDarkMode != null) {
      themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      AppColor().switchMode(isDarkTheme: isDarkMode);
    } else {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      PrefsUtil.putBool(PrefsCache.THEME_APP, brightness == Brightness.dark);
      AppColor().switchMode(isDarkTheme: brightness == Brightness.dark);
    }
    notifyListeners();
  }

  void toggleTheme(bool isDarkMode) {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    PrefsUtil.putBool(PrefsCache.THEME_APP, isDarkMode);
    AppColor().switchMode(isDarkTheme: isDarkMode);
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.colorBackground,
    appBarTheme: AppBarTheme(
        color: AppColor.colorAppBarDark,
        titleTextStyle: const TextStyle(color: Colors.white)),
    primaryColor: AppColor.colorBlack,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white),
    toggleableActiveColor: AppColor.colorPrimaryButton,
    indicatorColor: AppColor.colorPrimaryButton,
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          color: Colors.white, titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)),
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.black,
        primaryVariant: Colors.black,
        secondary: Colors.red,
      ),
      iconTheme: IconThemeData(color: AppColor.colorBlack),
      toggleableActiveColor: AppColor.colorPrimaryButton,
      indicatorColor: AppColor.colorPrimaryButton
      // checkboxTheme: CheckboxThemeData(
      //     // checkColor: MaterialStateProperty.all(AppColor.colorPrimaryButton)
      //     fillColor: MaterialStateProperty.all(AppColor.colorPrimaryButton))
      // fontFamily: 'QuickSand'
      );
}
