import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/pages/event_details_screen/event_details_widget.dart';
import 'package:partylink/pages/event_details_screen/store/event_details_store.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late GlobalsThemeVar globalsThemeVar;
  late GlobalsStore globalsStore;
  late EventDetailsStore eventDetailsStore;

  bool entrouIniciaPage = false;

  @override
  void didChangeDependencies() {
    globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    globalsStore = Provider.of<GlobalsStore>(context);
    eventDetailsStore = Provider.of<EventDetailsStore>(context);

    if (!entrouIniciaPage) {
      _iniciaPage();
    }

    super.didChangeDependencies();
  }

  Future _iniciaPage() async {
    entrouIniciaPage = true;

    if (!mounted) return;
    setState(() {
      globalsStore.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: globalsThemeVar.themeColors.secondaryBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            globalsStore.loading
                ? GlobalsComponents(context).loadingPage(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width)
                : EventDetailsWidget(context).eventDetailsWidgetPrincipal(
                    context,
                  ),
            Observer(builder: (_) {
              return Visibility(
                visible: globalsStore.loading,
                child: GlobalsComponents(context).loadingPage(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width),
              );
            })
          ],
        ),
      ),
    );
  }
}
