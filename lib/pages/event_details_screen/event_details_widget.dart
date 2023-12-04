import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/globals/globals_function.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/globals/theme_controller.dart';
import 'package:partylink/model/product_model.dart';
import 'package:partylink/pages/event_details_screen/event_details_functions.dart';
import 'package:partylink/pages/event_details_screen/store/event_details_store.dart';
import 'package:partylink/pages/home_screen/home_page.dart';
import 'package:partylink/pages/home_screen/store/home_store.dart';
import 'package:provider/provider.dart';

class EventDetailsWidget {
  BuildContext context;
  EventDetailsWidget(this.context);

  Widget eventDetailsWidgetPrincipal(BuildContext context) {
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
        text: 'Detalhes de Evento',
        iconPrefix: FontAwesomeIcons.chevronLeft,
        onTapPrefix: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
    );
  }

  Widget _widgetBody(context) {
    final eventDetailsStore = Provider.of<EventDetailsStore>(context);
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final homeStore = Provider.of<HomeStore>(context);

    initializeDateFormatting('pt_BR', null);

    String formattedDate =
        GlobalsFunctions().desconvertData(eventDetailsStore.eventSelec.data);
    DateTime date = DateFormat('dd/MM/yyyy').parse(formattedDate);
    String dayOfWeek = DateFormat('EEEE', 'pt_BR').format(date);

    List<int> idsToFilter = [];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventDetailsStore.eventSelec.nome,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: GlobalsSizes().mediumSize,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: 95,
            decoration: BoxDecoration(
              color: globalsThemeVar.themeColors.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(GlobalsSizes().borderSize),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: GlobalsSizes().marginSize,
                  vertical: GlobalsSizes().marginSize / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.calendarDays,
                    color: globalsThemeVar.themeColors.primaryColor,
                    size: 60,
                  ),
                  const SizedBox(width: 25),
                  Container(
                    width: 1,
                    color: globalsThemeVar.themeColors.blackTextColor,
                  ),
                  const SizedBox(width: 25),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        formattedDate,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: GlobalsSizes().smallSize,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        dayOfWeek,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: GlobalsSizes().smallSize,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descrição: ',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    fontWeight: FontWeight.bold,
                    color: globalsThemeVar.themeColors.blackTextColor),
              ),
              const SizedBox(height: 5),
              Text(
                eventDetailsStore.eventSelec.descricao,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    color: globalsThemeVar.themeColors.grayTextColor),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Produtos Adicionados: ',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    fontWeight: FontWeight.bold,
                    color: globalsThemeVar.themeColors.blackTextColor),
              ),
              const SizedBox(height: 5),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: eventDetailsStore.eventSelec.pedidos.length,
                itemBuilder: (_, index) {
                  idsToFilter.add(
                      eventDetailsStore.eventSelec.pedidos[index].produtoId);
                  eventDetailsStore.filterProducts(homeStore, idsToFilter);

                  return _orderCard(
                    context,
                    eventDetailsStore.eventSelec.pedidos[index],
                    eventDetailsStore.temporaryProducts,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Total a Pagar: ',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    fontWeight: FontWeight.bold,
                    color: globalsThemeVar.themeColors.blackTextColor),
              ),
              const SizedBox(width: 5),
              Text(
                'R\$ ${eventDetailsStore.totalValueOrder}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    color: globalsThemeVar.themeColors.blackTextColor,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              if (await EventDetailsFunctions(context)
                  .deleteEvent(eventDetailsStore.eventSelec.id)) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              } else {
                print('Erro');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.trashCan,
                  color: globalsThemeVar.themeColors.redDetailColor,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'Deletar Evento',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: GlobalsSizes().smallSize,
                      color: globalsThemeVar.themeColors.redDetailColor),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          GlobalsComponents(context)
              .simpleButton(buttonText: 'Efetuar Pagamento', action: () {}),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _orderCard(context, order, orderProducts) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final eventDetailsStore = Provider.of<EventDetailsStore>(context);

    Product matchingProduct = orderProducts.firstWhere(
      (product) => product.id == order.produtoId,
    );

    eventDetailsStore.calcularValorPedido(order, matchingProduct);

    return GestureDetector(
      child: Container(
        height: 95,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: globalsThemeVar.themeColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(GlobalsSizes().borderSize),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Container(
                height: 69,
                width: 69,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: globalsThemeVar.themeColors.primaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      matchingProduct.nome!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: GlobalsSizes().smallSize,
                        fontStyle: FontStyle.italic,
                        color: globalsThemeVar.themeColors.blackTextColor,
                      ),
                    ),
                    Text(
                      'R\$ ${eventDetailsStore.individualOrderValue}',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: GlobalsSizes().smallSize,
                        fontStyle: FontStyle.italic,
                        color: globalsThemeVar.themeColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
