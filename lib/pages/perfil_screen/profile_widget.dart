import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/globals/theme_controller.dart';
import 'package:partylink/pages/home_screen/home_page.dart';
import 'package:provider/provider.dart';

class ProfileWidget {
  BuildContext context;
  ProfileWidget(this.context);

  Widget profileWidgetPrincipal(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        const SizedBox(height: 30),
        _appBar(context),
        const SizedBox(height: 30),
        _widgetBody(context),
      ]),
    );
  }

  Widget _appBar(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: GlobalsComponents(context).appBarIconTexto(
        context,
        text: 'Perfil do Usuário',
      ),
    );
  }

  Widget _widgetBody(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    // final globalsStore = Provider.of<GlobalsStore>(context, listen: false);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Detalhes Pessoais',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    color: globalsThemeVar.themeColors.blackTextColor),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'mudar',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: GlobalsSizes().smallSize,
                      color: globalsThemeVar.themeColors.primaryColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: globalsThemeVar.themeColors.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(GlobalsSizes().borderSize),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: GlobalsSizes().marginSize * 0.5,
                  vertical: GlobalsSizes().marginSize * 0.5),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: globalsThemeVar.themeColors.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(GlobalsSizes().borderSize),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Caique Brandani',
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: GlobalsSizes().smallSize * 0.9,
                              overflow: TextOverflow.ellipsis,
                              color: globalsThemeVar.themeColors.grayTextColor,
                              fontStyle: FontStyle.italic),
                        ),
                        _divider(context),
                        Text(
                          'caique@gmail.com',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: GlobalsSizes().smallSize * 0.9,
                            overflow: TextOverflow.ellipsis,
                            color: globalsThemeVar.themeColors.grayTextColor,
                          ),
                        ),
                        _divider(context),
                        Text(
                          '+55 35 9911039271',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: GlobalsSizes().smallSize * 0.9,
                            overflow: TextOverflow.ellipsis,
                            color: globalsThemeVar.themeColors.grayTextColor,
                          ),
                        ),
                        _divider(context),
                        Text(
                          'Itajubá - MG',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: GlobalsSizes().smallSize * 0.9,
                            overflow: TextOverflow.ellipsis,
                            color: globalsThemeVar.themeColors.grayTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _redirectionButton(context, 'Pedidos', HomePage()),
          const SizedBox(height: 20),
          _redirectionButton(context, 'Método de Pagamento', HomePage()),
          const SizedBox(height: 20),
          _redirectionButton(context, 'Perguntas Frequentes', HomePage()),
          const SizedBox(height: 20),
          _redirectionButton(context, 'Ajuda', HomePage()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _divider(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Container(
      height: 1,
      width: double.infinity,
      color: globalsThemeVar.themeColors.grayTextColor,
    );
  }

  Widget _redirectionButton(context, text, pageRedirection) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => pageRedirection));
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: globalsThemeVar.themeColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(GlobalsSizes().borderSize),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: GlobalsSizes().marginSize * 0.5,
              vertical: GlobalsSizes().marginSize * 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: globalsThemeVar.themeColors.blackTextColor,
                  fontFamily: 'Montserrat',
                  fontSize: GlobalsSizes().smallSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Icon(
                FontAwesomeIcons.chevronRight,
                color: globalsThemeVar.themeColors.blackTextColor,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
