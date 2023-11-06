import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/pages/login_screen/store/login_store.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';

class LoginWidget {
  BuildContext context;
  LoginWidget(this.context);

  Widget loginWidgetPrincipal(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _headerWidget(context),
        Observer(builder: (context) {
          if (loginStore.hasLogin == true) {
            return _loginForm();
          } else {
            return _registerForm();
          }
        }),
      ],
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
    );
  }

  Widget _headerWidget(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final loginStore = Provider.of<LoginStore>(context);

    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: globalsThemeVar.themeColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(GlobalsSizes().borderSize),
                  bottomRight: Radius.circular(GlobalsSizes().borderSize),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/simple_logo.png'),
                  scale: 1.3,
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
              child: Observer(
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          loginStore.setButtonValue(true);
                        },
                        child: Container(
                          width: 110,
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: loginStore.hasLogin == true
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0,
                                        color: globalsThemeVar
                                            .themeColors.blackTextColor),
                                  ),
                                )
                              : const BoxDecoration(),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: GlobalsSizes().smallSize,
                                color:
                                    globalsThemeVar.themeColors.blackTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          loginStore.setButtonValue(false);
                        },
                        child: Container(
                          width: 110,
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: loginStore.hasLogin == false
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0,
                                        color: globalsThemeVar
                                            .themeColors.blackTextColor),
                                  ),
                                )
                              : const BoxDecoration(),
                          child: Center(
                            child: Text(
                              'Cadastro',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: GlobalsSizes().smallSize,
                                color:
                                    globalsThemeVar.themeColors.blackTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _loginForm() {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final globalsStore = Provider.of<GlobalsStore>(context);
    final loginStore = Provider.of<LoginStore>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: GlobalsSizes().marginSize),
        _textFormField(
            controller: loginStore.loginControllerEmail,
            keyBoardType: TextInputType.emailAddress,
            labelText: 'Endereço de Email'),
        SizedBox(height: GlobalsSizes().marginSize / 2),
        _textFormField(
            controller: loginStore.loginControllerPassword, labelText: 'Senha'),
        SizedBox(height: GlobalsSizes().marginSize),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Esqueceu sua Senha?',
            style: TextStyle(
              color: globalsThemeVar.themeColors.primaryColor,
              fontFamily: 'Montserrat',
              fontSize: GlobalsSizes().smallSize,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: GlobalsSizes().marginSize),
        GlobalsComponents(context).simpleButton(
          action: () async {
            globalsStore.setLoading(true);

            await Future.delayed(
              const Duration(seconds: 1),
            );

            globalsStore.setLoading(false);
          },
          buttonText: 'Logar',
        ),
        SizedBox(height: GlobalsSizes().marginSize),
      ]),
    );
  }

  Widget _registerForm() {
    // final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final globalsStore = Provider.of<GlobalsStore>(context);
    final loginStore = Provider.of<LoginStore>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: GlobalsSizes().marginSize),
        _textFormField(
            controller: loginStore.registerControllerName,
            keyBoardType: TextInputType.name,
            labelText: 'Nome Completo'),
        SizedBox(height: GlobalsSizes().marginSize / 2),
        _textFormField(
            controller: loginStore.registerControllerEmail,
            keyBoardType: TextInputType.emailAddress,
            labelText: 'Endereço de Email'),
        SizedBox(height: GlobalsSizes().marginSize / 2),
        _textFormField(
            controller: loginStore.registerControllerPhone,
            keyBoardType: TextInputType.phone,
            labelText: 'Telefone de Contato'),
        SizedBox(height: GlobalsSizes().marginSize / 2),
        _textFormField(
            controller: loginStore.registerControllerAddress,
            keyBoardType: TextInputType.streetAddress,
            labelText: 'Endereço'),
        SizedBox(height: GlobalsSizes().marginSize / 2),
        _textFormField(
            controller: loginStore.registerControllerPassword,
            labelText: 'Senha'),
        SizedBox(height: GlobalsSizes().marginSize),
        GlobalsComponents(context).simpleButton(
          action: () async {
            globalsStore.setLoading(true);

            await Future.delayed(
              const Duration(seconds: 1),
            );

            globalsStore.setLoading(false);
          },
          buttonText: 'Registrar-se',
        ),
        SizedBox(height: GlobalsSizes().marginSize),
      ]),
    );
  }

  Widget _textFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyBoardType,
  }) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return TextFormField(
      keyboardType: keyBoardType ?? TextInputType.text,
      cursorColor: globalsThemeVar.themeColors.grayTextColor,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: globalsThemeVar.themeColors
                .grayTextColor, // Cor da underline quando o campo não está focado
          ),
        ),
        border: const UnderlineInputBorder(),
        labelText: labelText,
        labelStyle: TextStyle(
            color: globalsThemeVar.themeColors.grayTextColor,
            fontFamily: 'Montserrat',
            fontSize: GlobalsSizes().smallSize,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
