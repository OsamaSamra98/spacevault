import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_spacevault/change_notifiers/Account_change_notifier.dart';
import 'package:project_spacevault/screens/Empty_Screen.dart';
import 'package:project_spacevault/screens/UpdatePassword_Screen.dart';
import 'package:project_spacevault/screens/about_Screen.dart';
import 'package:project_spacevault/screens/home_Screen.dart';
import 'package:project_spacevault/screens/createPassword_Screen.dart';
import 'package:project_spacevault/screens/launch_Screen.dart';
import 'package:project_spacevault/screens/menu_Screen.dart';
import 'package:project_spacevault/screens/newPassword_Screen.dart';
import 'package:project_spacevault/screens/setting_Screen.dart';
import 'package:project_spacevault/storage/app_pref_controller.dart';
import 'package:project_spacevault/storage/db_provider.dart';
import 'package:project_spacevault/utlis/newPasswordCard.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await AppPrefController().initPref();


  runApp(MainApp());
}

class MainApp extends StatefulWidget {

  @override
  _MainAppState createState() => _MainAppState();

  static void changeLanguage(
      {required BuildContext context, required Locale locale,}) {
    _MainAppState _mainAppState = context.findAncestorStateOfType<
        _MainAppState>()!;
    _mainAppState.changeLanguage(locale);

  }
}

class _MainAppState extends State<MainApp> {
  Locale _appLocale = Locale(AppPrefController().languageCode);

  void changeLanguage(Locale locale){
    setState(() {
      _appLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountChangeNotifier>(
            create: (_) => AccountChangeNotifier()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,

        ],
        supportedLocales: [
          const Locale('ar'),
          const Locale('en'),
        ],
        locale: _appLocale,

        theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              // brightness: Brightness.light,
              // actionsIconTheme: IconThemeData(color: Colors.black)
            )
        ),
        // home:LaunchScreen(),
        routes: {
          '/launch_Screen': (context) => launch_Screen(),
          '/menu_Screen': (context) => menu_Screen(),
          '/home_screen': (context) => home_Screen(),
          '/newPassword_Screen': (context) => newPassword_Screen(),
          '/settings_Screen': (context) => settings_Screen(),
          '/about_Screen': (context) => about_Screen(),

          '/newPasswordCard2': (context) => newPasswordCard(),



        },
        initialRoute: '/launch_Screen',
      ),
    );
  }
}


