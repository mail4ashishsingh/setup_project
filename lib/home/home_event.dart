import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'index.dart';
import '../utils/utils.dart';

@immutable
abstract class HomeEvent extends Equatable {
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class LoadHomeEvent extends HomeEvent {
  @override
  List<Object> get props => ["LocalConfigEvent"];

  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      return InHomeState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorHomeState(_?.toString());
    }
  }
}
