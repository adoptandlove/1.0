import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:getpet/analytics/analytics.dart';
import 'package:getpet/localization/app_localization.dart';
import 'package:getpet/localization/firebase_localization.dart';
import 'package:getpet/repositories/pets_db_repository.dart';
import 'package:getpet/routes.dart';
import 'package:getpet/preferences/app_preferences.dart';

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  @override
  Future deactivate() async {
    await PetsDBRepository().dispose();
    await AppPreferences().dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appTitle,
      initialRoute: Routes.ROUTE_HOME,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorObservers: [Analytics.firebaseObserver],
      theme: ThemeData(
        primaryColor: Color.fromARGB(0xFF, 0xDD, 0x61, 0x72),
        primaryColorDark: Color.fromARGB(0xFF, 0x93, 0x1F, 0x33),
        accentColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: Color.fromARGB(0xFF, 0x66, 0x66, 0x66),
          ),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterFireUILocalizations.withDefaultOverrides(
            FirebaseLabelOverrides()),
        AppLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('lt', 'LT'),
        const Locale('en', 'US'),
      ],
    );
  }
}
