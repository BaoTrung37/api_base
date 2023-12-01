import 'package:flutter/material.dart';

import 'resources.dart';

ThemeData getAppTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? colorsLight : colorsDark;

  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: colors.backgroundPrimary,
      foregroundColor: colors.textPrimary,
      titleTextStyle: AppTextStyles.headingXSmall.copyWith(
        color: colors.textPrimary,
      ),
      elevation: 0.4,
      centerTitle: true,
    ),
    brightness: brightness,
    scaffoldBackgroundColor: colors.backgroundPrimary,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    useMaterial3: true,
  );
}
