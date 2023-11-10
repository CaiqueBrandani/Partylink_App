import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/globals_components.dart';
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

  bool carregando = true;
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

    if (!mounted) return;
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeWidget(context).homeWidgetPrincipal(context),
      NewPageScreen('tela de eventos'),
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
                carregando
                    ? GlobalsComponents(context).loadingPage(
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width)
                    : _screens[homeStore.currentIndex],
                Observer(
                  builder: (_) {
                    return Visibility(
                      visible: globalsStore.loading,
                      child: GlobalsComponents(context).loadingPage(
                          MediaQuery.of(context).size.height,
                          MediaQuery.of(context).size.width),
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: Visibility(
              visible: carregando == false,
              child: BottomNavigationBar(
                selectedFontSize: 0,
                unselectedFontSize: 0,
                currentIndex: homeStore.currentIndex,
                onTap: homeStore.onTapeChange,
                backgroundColor:
                    globalsThemeVar.themeColors.secondaryBackgroundColor,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.house,
                        color: globalsThemeVar.themeColors.tertiaryColor,
                      ),
                      activeIcon: Icon(
                        FontAwesomeIcons.house,
                        color: globalsThemeVar.themeColors.primaryColor,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.calendar,
                        color: globalsThemeVar.themeColors.tertiaryColor,
                      ),
                      activeIcon: Icon(
                        FontAwesomeIcons.calendar,
                        color: globalsThemeVar.themeColors.primaryColor,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.clockRotateLeft,
                        color: globalsThemeVar.themeColors.tertiaryColor,
                      ),
                      activeIcon: Icon(
                        FontAwesomeIcons.clockRotateLeft,
                        color: globalsThemeVar.themeColors.primaryColor,
                      ),
                      label: ''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
