import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/globals/theme_controller.dart';
import 'package:provider/provider.dart';


class GlobalsComponents {
  BuildContext context;
  GlobalsComponents(this.context);

  Widget noConnectionPage({title, text, image, width, height}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    double sizeWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: sizeWidth / 3,
              ),
              SizedBox(height: GlobalsSizes().marginSize / 3),
              SizedBox(
                width: sizeWidth,
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.grayTextColor,
                    fontSize: GlobalsSizes().mediumSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: GlobalsSizes().marginSize / 3),
              SizedBox(
                width: sizeWidth,
                child: Text(
                  text ?? '',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.grayTextColor,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget emptyPage({title, text, image}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    double sizeWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: sizeWidth / 3,
            ),
            SizedBox(height: GlobalsSizes().marginSize / 3),
            SizedBox(
              width: sizeWidth,
              child: Text(
                title ?? '',
                style: TextStyle(
                  color: globalsThemeVar.themeColors.grayTextColor,
                  fontSize: GlobalsSizes().mediumSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: GlobalsSizes().marginSize / 3),
            SizedBox(
              width: sizeWidth,
              child: Text(
                text ?? '',
                style: TextStyle(
                  color: globalsThemeVar.themeColors.grayTextColor,
                  fontSize: GlobalsSizes().smallSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget loadingPage(double sizeH, double sizeW)  {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Container(
      height: sizeH,
      width: sizeW,
      color: globalsThemeVar.themeColors.primaryColor,
      child: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: globalsThemeVar.themeColors.secondaryColor,
          size: 40,
        ),
      ),
    );
  }

  Widget simpleButton({required action, buttonWidth, buttonText}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return GestureDetector(
      onTap: action,

      child: Container(
        height: 70,
        width: buttonWidth ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GlobalsSizes().borderSize),
          color: globalsThemeVar.themeColors.primaryColor,
        ),
        child: Center(
          child: Text(
            buttonText ?? '',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: globalsThemeVar.themeColors.whiteTextColor,
              fontSize: GlobalsSizes().smallSize,
            ),
          ),
        ),
      ),
    );
  }
}
