import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/pages/event_screen/store/event_store.dart';
import 'package:partylink/pages/home_screen/home_page.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';

class EventWidget {
  BuildContext context;
  EventWidget(this.context);

  Widget eventWidgetPrincipal(BuildContext context) {
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
        text: 'Eventos Criados',
        iconSufix: FontAwesomeIcons.plus,
        onTapSufix: () {},
      ),
    );
  }

  Widget _widgetBody(context) {
    final eventStore = Provider.of<EventStore>(context);

    if (eventStore.eventList.isEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GlobalsComponents(context).emptyPage(
                title: 'Sem Eventos',
                text: 'Selecione o botão laranja abaixo para criar evento',
                image: 'assets/images/event.png'),
            GlobalsComponents(context).simpleButton(
              action: () async {},
              buttonText: 'Criar Evento',
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        child: Observer(
          builder: (_) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: eventStore.eventList.length,
              itemBuilder: (_, index) {
                return _eventCard(
                  context,
                  eventStore.eventList[index],
                );
              },
            );
          },
        ),
      );
    }
  }

  Widget _eventCard(context, event) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: globalsThemeVar.themeColors.secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(GlobalsSizes().borderSize),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Nome: ',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.primaryColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
                Text(
                  '${event.nome}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.blackTextColor,
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Descrição: ',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.primaryColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
                Text(
                  '${event.descricao}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.blackTextColor,
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GlobalsComponents(context).simpleButton(
                action: () {}, buttonText: 'Detalhes', buttonWidth: 150.0)
          ],
        ),
      ),
    );
  }
}
