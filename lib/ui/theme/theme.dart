import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  colorScheme: _schemeLight(_themeLight.colorScheme),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  textButtonTheme: TextButtonThemeData(style: _textButtonLight),
  outlinedButtonTheme: OutlinedButtonThemeData(style: _outButtonLight),
  primaryColorDark: AppColor.mainColor,
  textTheme: _textLight(_themeLight.textTheme),
  scaffoldBackgroundColor: AppColor.backColor,
  floatingActionButtonTheme:
      _floatButtonLight(_themeLight.floatingActionButtonTheme),
  inputDecorationTheme: _inputDecorLight(_themeLight.inputDecorationTheme),
  progressIndicatorTheme: _progressLight(_themeLight.progressIndicatorTheme),
  bottomNavigationBarTheme:
      _botNavBarLight(_themeLight.bottomNavigationBarTheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    error: AppColor.greyDark,
    primary: AppColor.mainColor,
    // onPrimary: AppColor.mainColor,
    // primaryContainer: AppColor.mainColor,
  );
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: AppColor.mainColor,
    foregroundColor: AppColor.backColor,
    elevation: 0.0,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.backColor,
    ),
    headlineLarge: base.headlineMedium!.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: AppColor.backColor,
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontSize: 14,
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColor.mainColor,
    ),
  );
}

ProgressIndicatorThemeData _progressLight(ProgressIndicatorThemeData base) {
  return base.copyWith(
      linearTrackColor: AppColor.greyDark, color: AppColor.mainColor);
}

BottomNavigationBarThemeData _botNavBarLight(
    BottomNavigationBarThemeData base) {
  return base.copyWith(
    backgroundColor: Colors.white,
    selectedItemColor: AppColor.mainColor,
    unselectedItemColor: AppColor.greyMedium,
    selectedIconTheme: const IconThemeData(color: AppColor.mainColor),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontSize: 12),
  );
}

FloatingActionButtonThemeData _floatButtonLight(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: AppColor.mainColorMegaLight,
    foregroundColor: AppColor.mainColor,
  );
}

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
    // shape: const StadiumBorder(),
    backgroundColor: AppColor.mainColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(16));

ButtonStyle _textButtonLight = ElevatedButton.styleFrom(
  foregroundColor: AppColor.mainColor,
);

ButtonStyle _outButtonLight = OutlinedButton.styleFrom(
    foregroundColor: AppColor.greyDark,
    textStyle: const TextStyle(fontWeight: FontWeight.w400));

InputDecorationTheme _inputDecorLight(InputDecorationTheme base) {
  return base.copyWith(
    errorStyle: TextStyle(fontSize: 0, height: 0),
    filled: true,
    isDense: true,
    fillColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.focused)
            ? AppColor.mainColorHyperLight
            : states.contains(MaterialState.error)
                ? AppColor.mainColor.withOpacity(0.42)
                : Colors.white),
    labelStyle: const TextStyle(color: AppColor.greyLight),
    enabledBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.greyLight)),
    focusedBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.greyLight)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.greyLight),
    ),
    border: const OutlineInputBorder(),
  );
}
