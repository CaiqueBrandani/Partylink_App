import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import '../theme/theme_colors_dark.dart';
import '../theme/theme_colors_light.dart';

class GlobalsVars {
  String nomeApp = "PartyLink";
  final urlApi = "";
  final linkLojaApps = "";
}

class GlobalsStyles {
  var negritoFont = FontWeight.w500;
  double elevacaoPadrao = 5.0;
}

class GlobalsSizes {
  final double borderSize = 10;
  final double marginSize = 20;

  final sizeTitulo = 22.0;
  final sizeSubtitulo = 17.0;
  final sizeTextMedio = 15.0;
  final sizeText = 11.0;
}

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