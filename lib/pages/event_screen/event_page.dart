// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:partylink/globals/globals_store/globals_store.dart';
// import 'package:partylink/globals/globals_components.dart';
// import 'package:partylink/pages/event_screen/event_function.dart';
// import 'package:partylink/pages/event_screen/event_widget.dart';
// import 'package:provider/provider.dart';

// import '../../globals/theme_controller.dart';

// class EventPage extends StatefulWidget {
//   const EventPage({super.key});

//   @override
//   State<EventPage> createState() => _EventPageState();
// }

// class _EventPageState extends State<EventPage> {
//   late GlobalsThemeVar globalsThemeVar;
//   late GlobalsStore globalsStore;

//   bool carregando = true;
//   bool entrouIniciaPage = false;

//   @override
//   void didChangeDependencies() {
//     globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
//     globalsStore = Provider.of<GlobalsStore>(context);

//     if (!entrouIniciaPage) {
//       _iniciaPage();
//     }

//     super.didChangeDependencies();
//   }

//   Future _iniciaPage() async {
//     entrouIniciaPage = true;

//     await EventFunctions(context).getEvent();

//     // if (!mounted) return;
//     globalsStore.setLoading(false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: globalsThemeVar.themeColors.secondaryBackgroundColor,
//         resizeToAvoidBottomInset: true,
//         body: Stack(
//           children: [
//             globalsStore.loading
//                 ? GlobalsComponents(context).loadingPage(
//                     MediaQuery.of(context).size.height,
//                     MediaQuery.of(context).size.width)
//                 : EventWidget(context).eventWidgetPrincipal(context),

//             Observer(
//               builder: (_) {
//                 return Visibility(
//                   visible: globalsStore.loading,
//                   child: GlobalsComponents(context).loadingPage(
//                       MediaQuery.of(context).size.height,
//                       MediaQuery.of(context).size.width),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
