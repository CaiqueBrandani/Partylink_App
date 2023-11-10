import 'package:flutter/material.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:provider/provider.dart';

import '../../globals/globals_var.dart';
import '../../globals/theme_controller.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage(this._navigation, {super.key});

  final dynamic _navigation;

  @override
  Widget build(BuildContext context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: globalsThemeVar.themeColors.secondaryBackgroundColor,
        body: Container(
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
              Text(
                'Sem Conexão',
                style: TextStyle(
                  color: globalsThemeVar.themeColors.grayTextColor,
                  fontFamily: 'Montserrat',
                  fontSize: GlobalsSizes().mediumSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: GlobalsSizes().marginSize / 3),
              Text(
                'Você está sem conexão com a internet, verifique sua conexão e tente novamente!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: globalsThemeVar.themeColors.grayTextColor,
                  fontFamily: 'Montserrat',
                  fontSize: GlobalsSizes().smallSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: GlobalsSizes().marginSize / 2),
              GlobalsComponents(context).simpleButton(
                action: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => _navigation),
                  );
                },
                buttonText: 'Tentar Novamente',
              )
            ],
          ),
        ),
      ),
    );
  }
}
