import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globals/globals_var.dart';

class LoginWidget {
  BuildContext context;
  LoginWidget(this.context);

  Widget loginWidgetPrincipal(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: _bodyLogin(context),
    );
  }

  Widget _bodyLogin(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                color: globalsThemeVar.themeColors.primaryBackgroundColor
              ),
            )
          ]),
        ],
      ),
    );
  }
}
