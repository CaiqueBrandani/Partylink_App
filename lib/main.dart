import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:partylink/globals/globals_store/globals_store.dart';
import 'package:partylink/globals/theme_controller.dart';
import 'package:partylink/model/user_model.dart';
import 'package:partylink/pages/event_details_screen/store/event_details_store.dart';
import 'package:partylink/pages/event_screen/store/event_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals/globals_function.dart';
import 'globals/globals_components.dart';
import 'pages/home_screen/store/home_store.dart';
import 'pages/login_screen/login_page.dart';
import 'pages/login_screen/store/login_store.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<GlobalsThemeVar>(
          create: (context) => GlobalsThemeVar(),
        ),

        // Store
        Provider<GlobalsStore>(
          create: (context) => GlobalsStore(),
        ),

        Provider<LoginStore>(
          create: (context) => LoginStore(),
        ),

        Provider<HomeStore>(
          create: (context) => HomeStore(),
        ),

        Provider<EventStore>(
          create: (context) => EventStore(),
        ),

        Provider<EventDetailsStore>(
          create: (context) => EventDetailsStore(),
        ),


        Provider<User>(
        create: (context) => User(),
      ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SharedPreferences preferences;
  late GlobalsThemeVar globalsThemeVar;

  bool startPage = false;

  @override
  void didChangeDependencies() {
    if (!startPage) {
      globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

      _startPage();
    }

    super.didChangeDependencies();
  }

  Future _startPage() async {
    preferences = await SharedPreferences.getInstance();
    startPage = true;

    await _setThemeMode();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    await _loginApp();
  }

  Future _setThemeMode() async {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    final int? temaApp = preferences.getInt('theme');

    if (!mounted) return;

    setState(() {
      globalsThemeVar.currentThemeMode =
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

      if (temaApp == null) {
        globalsThemeVar.currentThemeMode =
            brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      } else {
        if (temaApp == 0) {
          globalsThemeVar.currentThemeMode = ThemeMode.light;
        } else {
          globalsThemeVar.currentThemeMode = ThemeMode.dark;
        }
      }

      globalsThemeVar.setThemeColors();
    });
  }

  Future _loginApp() async {
    if (await GlobalsFunctions().verificaConexao()) {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
      // return;
    } else {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
      // return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalsComponents(context).loadingPage(
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
