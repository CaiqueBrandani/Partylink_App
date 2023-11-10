import 'package:flutter/material.dart';
import 'package:partylink/theme/theme_colors.dart';

class ThemeColorsLight implements ThemeColors {
  @override
  var primaryColor = const Color.fromRGBO(250, 74, 12, 1);

  @override
  var secondaryColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  var tertiaryColor = const Color.fromRGBO(199, 199, 199, 1);

  @override
  var transpColor = Colors.white.withOpacity(0.7);

  @override
  var primaryBackgroundColor = const Color.fromRGBO(246, 246, 249, 1);

  @override
  var secondaryBackgroundColor = const Color.fromRGBO(242, 242, 242, 1);

  @override
  var blackTextColor = const Color.fromRGBO(0, 0, 0, 1);

  @override
  var whiteTextColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  var grayTextColor = const Color.fromRGBO(154, 154, 157, 1);

  @override
  var redDetailColor = const Color.fromRGBO(223, 44, 44, 1);

  @override
  var shadedColor = const Color.fromRGBO(57, 57, 50, 0.5);
}
