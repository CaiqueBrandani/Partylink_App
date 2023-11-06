import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/globals_components.dart';
import 'package:partylink/pages/offline_screen/offline_widget.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({super.key});

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  late GlobalsThemeVar globalsThemeVar;
  late GlobalsStore globalsStore;

  bool carregando = true;
  bool entrouIniciaPage = false;

  @override
  void didChangeDependencies() {
    globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    globalsStore = Provider.of<GlobalsStore>(context);

    if (!entrouIniciaPage) {
      _iniciaPage();
    }

    super.didChangeDependencies();
  }

  Future _iniciaPage() async {
    entrouIniciaPage = true;

    if (!mounted) return;
    setState(() {
      carregando = false;
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
            carregando
                ? GlobalsComponents(context).loadingPage(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width)
                : OfflineWidget(context).offlineWidgetPrincipal(context),
                
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
