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

    return Column(
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
    );
  }

  Widget loadingPage(double sizeH, double sizeW) {
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

  Widget bottomNavigationBar(
      {required store,
      required firstIcon,
      required secondIcon,
      required thirtyIcon}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return BottomNavigationBar(
      selectedFontSize: 0,
      unselectedFontSize: 0,
      currentIndex: store.currentIndex,
      onTap: store.onTapeChange,
      backgroundColor: globalsThemeVar.themeColors.secondaryBackgroundColor,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              firstIcon,
              color: globalsThemeVar.themeColors.tertiaryColor,
            ),
            activeIcon: Icon(
              firstIcon,
              color: globalsThemeVar.themeColors.primaryColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              secondIcon,
              color: globalsThemeVar.themeColors.tertiaryColor,
            ),
            activeIcon: Icon(
              secondIcon,
              color: globalsThemeVar.themeColors.primaryColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              thirtyIcon,
              color: globalsThemeVar.themeColors.tertiaryColor,
            ),
            activeIcon: Icon(
              thirtyIcon,
              color: globalsThemeVar.themeColors.primaryColor,
            ),
            label: ''),
      ],
    );
  }

  Widget appBarIconTexto(contextAux,
      {
      String text = '',
      Color? textColor,
      VoidCallback? onTapPrefix,
      Color? colorIconPrefix,
      IconData? iconPrefix,
      VoidCallback? onTapSufix,
      Color? colorIconSufix,
      IconData? iconSufix}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Row(
      children: [
        const SizedBox(width: 25),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color:
                        textColor ?? globalsThemeVar.themeColors.blackTextColor,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        prefixIconWidget(
            colorIcon: colorIconSufix, icon: iconSufix, onTap: onTapSufix),
      ],
    );
  }

  Widget iconReturnWidget(contextAux,
      {VoidCallback? onTap, Color? colorIcon, IconData? icon}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    return GestureDetector(
        onTap: onTap ?? () => Navigator.of(contextAux).pop(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
          child: SizedBox(
            child: Icon(
              icon ?? Icons.arrow_back_ios_new_rounded,
              color: colorIcon ?? globalsThemeVar.themeColors.blackTextColor,
            ),
          ),
        ));
  }

  Widget prefixIconWidget(
      {VoidCallback? onTap, Color? colorIcon, IconData? icon}) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 38,
          width: 38,
          padding: const EdgeInsets.all(7),
          child: icon == null
              ? Container()
              : Icon(
                  icon,
                  color: colorIcon ??
                      globalsThemeVar.themeColors.blackTextColor,
                ),
        ));
  }
}
