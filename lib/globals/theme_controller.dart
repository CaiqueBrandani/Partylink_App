import 'package:flutter/material.dart';
import 'package:partylink/theme/theme_colors_dark.dart';
import 'package:partylink/theme/theme_colors_light.dart';

import '../theme/theme_colors.dart';

class GlobalsThemeVar extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;

  late ThemeColors themeColors = ThemeColorsLight();

  void setThemeColors() {
    themeColors = currentThemeMode == ThemeMode.light
        ? ThemeColorsLight()
        : ThemeColorsDark();

    notifyListeners();
  }
}