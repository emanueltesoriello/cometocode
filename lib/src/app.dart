import 'package:cometocode/resources/app_config.dart';
import 'package:cometocode/resources/app_localization.dart';
import 'package:cometocode/src/base/widget/ui/base_theme.dart';
import 'package:cometocode/src/start/di/start_page_providers.dart';
import 'package:cometocode/src/start/ui/navigator/start_page_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//todo
void mainCommon({required String host, required bool isProd}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      App(host: host, isProd: isProd),
    ),
  );
}

class App extends StatelessWidget {
  final String host;
  final bool isProd;

  App({required this.host, required this.isProd});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: _App(host: this.host, isProd: this.isProd)),
    );
  }
}

class _App extends StatefulWidget {
  // This widget is the root of your application.

  final String host;
  final bool isProd;

  _App({required this.host, required this.isProd});

  @override
  __AppState createState() => __AppState();
}

class __AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
            behavior: _ScrollBehaviour(), child: child ?? Container());
      },
      localizationsDelegates: [
        DefaultWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [const Locale.fromSubtags(languageCode: 'it')],
      title: 'ComeToCode',
      theme: MyAppTheme.themeData(context),
      home: MultiProvider(
        providers: [
          Provider(
            create: (context) =>
                AppConfig(host: widget.host, isProd: widget.isProd),
          ),
          ...startPageProviders,
        ],
        child: StartPageNavigator(),
      ),
    );
  }
}

class _ScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
