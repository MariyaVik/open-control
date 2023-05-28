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
  scaffoldBackgroundColor: AppColor.whiteColor,
  floatingActionButtonTheme:
      _floatButtonLight(_themeLight.floatingActionButtonTheme),
  inputDecorationTheme: _inputDecorLight(_themeLight.inputDecorationTheme),
  // progressIndicatorTheme: _progressLight(_themeLight.progressIndicatorTheme),
  bottomNavigationBarTheme:
      _botNavBarLight(_themeLight.bottomNavigationBarTheme),
  chipTheme: _chipLight(_themeLight.chipTheme),
  checkboxTheme: _checkLight(_themeLight.checkboxTheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    error: AppColor.error,
    primary: AppColor.mainColor,
    // onPrimary: AppColor.mainColor,
    // primaryContainer: AppColor.mainColor,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 20,
      height: 1.6,
      fontFamily: 'Inter',
    ),
    headlineLarge: base.headlineLarge!.copyWith(
      fontSize: 24,
      height: 1.17,
      color: AppColor.textMain,
      fontFamily: 'PTSerif',
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontSize: 16,
      height: 1.5,
      fontFamily: 'Inter',
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontSize: 14,
      height: 1.43,
      fontFamily: 'Inter',
    ),
    labelLarge: base.labelLarge!.copyWith(
      // button
      fontSize: 14,
      height: 1.43,
      color: AppColor.whiteColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontSize: 12,
      height: 1.7,
      fontWeight: FontWeight.w700,
      fontFamily: 'Inter',
    ),
    labelSmall: base.bodyMedium!.copyWith(
      fontSize: 12,
      height: 1.7,
      fontWeight: FontWeight.w500,
      color: AppColor.textLow,
      fontFamily: 'Inter',
    ),
  );
}

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
    // shape: const StadiumBorder(),
    backgroundColor: AppColor.mainColor,
    foregroundColor: AppColor.whiteColor,
    disabledBackgroundColor: AppColor.greyMegaLight,
    disabledForegroundColor: AppColor.greyMedium,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));

ButtonStyle _textButtonLight = TextButton.styleFrom(
  foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
      states.contains(MaterialState.pressed)
          ? AppColor.mainDark
          : AppColor.mainLight),
  disabledForegroundColor: AppColor.greyMedium,
  iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
      states.contains(MaterialState.pressed)
          ? AppColor.mainDark
          : AppColor.mainLight),
  disabledIconColor: AppColor.greyMedium,
);

ButtonStyle _outButtonLight = OutlinedButton.styleFrom(
  foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
      states.contains(MaterialState.pressed)
          ? AppColor.mainColor
          : AppColor.textMain),
  backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
      states.contains(MaterialState.pressed)
          ? AppColor.pinkLight
          : AppColor.whiteColor),
  side: BorderSide(
      color: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
          states.contains(MaterialState.pressed)
              ? AppColor.mainLight
              : AppColor.greyLight)),
  disabledBackgroundColor: AppColor.greyMegaLight,
  disabledForegroundColor: AppColor.greyMedium,
);

InputDecorationTheme _inputDecorLight(InputDecorationTheme base) {
  return base.copyWith(
    errorStyle: TextStyle(fontSize: 0, height: 0),
    isDense: true,
    filled: true,
    fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
        states.contains(MaterialState.disabled)
            ? AppColor.greyMegaLight
            : Colors.white),
    labelStyle: const TextStyle(color: AppColor.textLow),
    enabledBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.greyLight)),
    focusedBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.pinkDark)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.error),
    ),
    border: const OutlineInputBorder(),
  );
}

CheckboxThemeData _checkLight(CheckboxThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
        states.contains(MaterialState.disabled)
            ? AppColor.greyMegaLight
            : AppColor.mainColor),
    checkColor: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
        states.contains(MaterialState.disabled)
            ? AppColor.greyLight
            : AppColor.whiteColor),
  );
}

ChipThemeData _chipLight(ChipThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    showCheckmark: false,
    padding: const EdgeInsets.all(8),
    backgroundColor: AppColor.pinkDark,
    selectedColor: AppColor.mainColor,
    labelStyle: TextStyle(color: AppColor.whiteColor),
    // iconTheme: IconThemeData(
    //   color: MaterialStateColor.resolveWith(
    //     (Set<MaterialState> states) => states.contains(MaterialState.selected)
    //         ? AppColor.greyDark
    //         : AppColor.backColor,
    //   ),
  );
}

FloatingActionButtonThemeData _floatButtonLight(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    backgroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? AppColor.greyMegaLight
            : AppColor.mainColor),
    foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? AppColor.greyLight
            : AppColor.whiteColor),
    elevation: 0,
  );
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: AppColor.whiteColor,
    foregroundColor: AppColor.textMain,
    elevation: 0.0,
    // centerTitle: true,
  );
}

// ProgressIndicatorThemeData _progressLight(ProgressIndicatorThemeData base) {
//   return base.copyWith(
//       linearTrackColor: AppColor.greyDark, color: AppColor.mainColor);
// }

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
