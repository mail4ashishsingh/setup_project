import 'package:flutter/material.dart';
import 'package:setupproject/universal/dev_scaffold.dart';

import 'index.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    var _homeBloc = HomeBloc();
    return DevScaffold(title: 'Home', body: HomeScreen(homeBloc: _homeBloc));
  }
}
