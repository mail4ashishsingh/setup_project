import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setupproject/agenda/agenda_page.dart';
import 'package:setupproject/agenda/session_detail.dart';
import 'package:setupproject/faq/faq_page.dart';
import 'package:setupproject/findDevFest/findDevFest_page.dart';
import 'package:setupproject/home/home_page.dart';
import 'package:setupproject/speakers/speaker_page.dart';
import 'package:setupproject/sponsors/sponsor_page.dart';
import 'package:setupproject/team/team_page.dart';

import 'index.dart';
import '../utils/utils.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeOn = Utils.prefs.getBool(Utils.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //* Custom Google Font
              fontFamily: Utils.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: HomePage(),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              AgendaPage.routeName: (context) => AgendaPage(),
              SpeakersPage.routeName: (context) => SpeakersPage(),
//              SessionDetail.routeName: (context) => SessionDetail(),
              TeamPage.routeName: (context) => TeamPage(),
              SponsorPage.routeName: (context) => SponsorPage(),
              FaqPage.routeName: (context) => FaqPage(),
              FindDevFestPage.routeName: (context) => FindDevFestPage(),
            },
          );
        },
      ),
    );
  }
}
