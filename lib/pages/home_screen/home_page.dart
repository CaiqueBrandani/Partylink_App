// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/pages/event_screen/event_function.dart';
import 'package:partylink/pages/event_screen/event_page.dart';
import 'package:partylink/pages/event_screen/event_widget.dart';
import 'package:partylink/pages/home_screen/home_function.dart';
import 'package:partylink/pages/home_screen/home_widget.dart';
import 'package:partylink/pages/home_screen/screen_test.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';
import 'store/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GlobalsThemeVar globalsThemeVar;
  late GlobalsStore globalsStore;
  late HomeStore homeStore;

  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "scaffoldKey");

  bool entrouIniciaPage = false;

  @override
  void didChangeDependencies() {
    globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    globalsStore = Provider.of<GlobalsStore>(context);
    homeStore = Provider.of<HomeStore>(context);

    if (!entrouIniciaPage) {
      _iniciaPage();
    }

    super.didChangeDependencies();
  }

  Future _iniciaPage() async {
    entrouIniciaPage = true;

    await HomeFunctions(context).getCategory();
    await HomeFunctions(context).getProduct();
    await HomeFunctions(context).getMeasure();
    await EventFunctions(context).getEvent();

    homeStore.loadProducts();

    if (!mounted) return;
    
    setState(() {
      globalsStore.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeWidget(context).homeWidgetPrincipal(context),
      EventWidget(context).eventWidgetPrincipal(context),
      // EventPage(),
      //EventsWidget(context).eventWidgetPrincipal(context),
      NewPageScreen('tela de recentes'),
      //ProfileWidget(context).profileWidgetPrincipal(context),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Observer(
        builder: (_) {
          return Scaffold(
            backgroundColor:
                globalsThemeVar.themeColors.secondaryBackgroundColor,
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                globalsStore.loading
                    ? GlobalsComponents(context).loadingPage(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                      )
                    : screens[homeStore.currentIndex],
                Observer(
                  builder: (_) {
                    return Visibility(
                      visible: globalsStore.loading,
                      child: GlobalsComponents(context).loadingPage(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: Visibility(
              visible: globalsStore.loading == false,
              child: GlobalsComponents(context).bottomNavigationBar(
                store: homeStore,
                firstIcon: FontAwesomeIcons.house,
                secondIcon: FontAwesomeIcons.calendar,
                thirtyIcon: FontAwesomeIcons.clockRotateLeft,
              ),
            ),
          );
        },
      ),
    );
  }
}
