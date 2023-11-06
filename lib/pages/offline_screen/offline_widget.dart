import 'package:flutter/material.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/globals/globals_function.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:provider/provider.dart';

import '../../globals/globals_store/globals_store.dart';
import '../../globals/theme_controller.dart';
import '../login_screen/login_page.dart';

class OfflineWidget {
  BuildContext context;
  OfflineWidget(this.context);

  Widget offlineWidgetPrincipal(BuildContext context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final globalsStore = Provider.of<GlobalsStore>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/offline.png',
            width: GlobalsSizes().marginSize * 3,
            height: GlobalsSizes().marginSize * 3,
          ),
          SizedBox(height: GlobalsSizes().marginSize / 2),
          Text('Sem Conexão',
              style: TextStyle(
                  color: globalsThemeVar.themeColors.grayTextColor,
                  fontFamily: 'Montserrat',
                  fontSize: GlobalsSizes().mediumSize,
                  fontStyle: FontStyle.italic)),
          SizedBox(height: GlobalsSizes().marginSize / 3),
          Text(
              'Você está sem conexão com a internet, verifique sua conexão e tente novamente!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: globalsThemeVar.themeColors.grayTextColor,
                  fontFamily: 'Montserrat',
                  fontSize: GlobalsSizes().smallSize,
                  fontStyle: FontStyle.italic)),
          SizedBox(height: GlobalsSizes().marginSize / 2),
          GlobalsComponents(context).simpleButton(
              action: () async {
                globalsStore.setLoading(true);

                if (!await GlobalsFunctions().verificaConexao()) {
                  Navigator.of(context).pop();
                }

                await Future.delayed(
                  const Duration(seconds: 1),
                );

                globalsStore.setLoading(false);
              },
              buttonText: 'Tentar Novamente')
        ],
      ),
    );
  }
}
