import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required HomeBloc homeBloc})
      : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;
  @override
  _HomeScreenState createState() => _HomeScreenState(_homeBloc);
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  _HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.add(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: widget._homeBloc,
        builder: (context, state) {
          if (state is UnHomeState) {
            return Center(child: CircularProgressIndicator());
            // ignore: missing_return
          }
          return HomeFront();
        });
  }
}
