import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/globals/globals_function.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/pages/event_details_screen/event_details_page.dart';
import 'package:partylink/pages/event_details_screen/store/event_details_store.dart';
import 'package:partylink/pages/event_screen/store/event_store.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';

class EventWidget {
  BuildContext context;
  EventWidget(this.context);

  Widget eventWidgetPrincipal(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          _appBar(context),
          _widgetBody(context),
        ]),
      ),
    );
  }

  Widget _appBar(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: GlobalsComponents(context).appBarIconText(
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
              physics: const NeverScrollableScrollPhysics(),
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
    final eventDetailsStoreT = Provider.of<EventDetailsStore>(context, listen: true);

    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: globalsThemeVar.themeColors.secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(GlobalsSizes().borderSize),
        ),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: GlobalsSizes().marginSize, vertical: 10),
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
                Expanded(
                  child: Text(
                    '${event.nome}',
                    // 'Caralho',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: globalsThemeVar.themeColors.blackTextColor,
                      fontFamily: 'Montserrat',
                      fontSize: GlobalsSizes().smallSize,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Data: ',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.primaryColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
                Text(
                  GlobalsFunctions().desconvertData(event.data),
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
                  'Itens Totais: ',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.primaryColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
                Text(
                  '${event.pedidos.length} itens',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
                  'Status: ',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.primaryColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${event.status}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: globalsThemeVar.themeColors.blackTextColor,
                        fontFamily: 'Montserrat',
                        fontSize: GlobalsSizes().smallSize,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      event.status == 'Confirmado'
                          ? FontAwesomeIcons.solidCircleCheck
                          : FontAwesomeIcons.circleExclamation,
                      color: event.status == 'Confirmado'
                          ? Colors.green
                          : Colors.amber,
                      size: 10,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            GlobalsComponents(context).simpleButton(
                action: () {
                  eventDetailsStoreT.setEventSelec(event);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const EventDetailsPage()));
                },
                buttonText: 'Detalhes',
                buttonWidth: 150.0)
          ],
        ),
      ),
    );
  }
}
