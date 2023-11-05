import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:provider/provider.dart';

class GlobalsWidgets {
  BuildContext context;
  GlobalsWidgets(this.context);

  Widget paginaVazia({titulo, texto, imagem}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    double sizeWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagem,
              fit: BoxFit.cover,
              height: sizeWidth / 2,
            ),
            SizedBox(height: GlobalsSizes().marginSize / 2),
            SizedBox(
              width: sizeWidth,
              child: Text(
                titulo ?? '',
                style: TextStyle(
                    color: globalsThemeVar.themeColors.grayTextColor,
                    fontSize: GlobalsSizes().sizeTextMedio,
                    fontWeight: GlobalsStyles().negritoFont),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: GlobalsSizes().marginSize / 2),
            SizedBox(
              width: sizeWidth,
              child: Text(
                texto ?? '',
                style: TextStyle(
                    color: globalsThemeVar.themeColors.grayTextColor,
                    fontSize: GlobalsSizes().sizeText,
                    fontWeight: GlobalsStyles().negritoFont),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget loadingPage(double sizeH, double sizeW) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    return Container(
      height: sizeH,
      width: sizeW,
      color: globalsThemeVar.themeColors.transpColor,
      child: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: globalsThemeVar.themeColors.primaryColor,
          size: 40,
        ),
      ),
    );
  }
}