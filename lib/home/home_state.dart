import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]);

  HomeState getStateCopy();
}

class UnHomeState extends HomeState {
  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }

  @override
  List<Object> get props => ["UnHomeState"];
}

class InHomeState extends HomeState {
  @override
  List<Object> get props => ["InHomeState"];

  @override
  HomeState getStateCopy() {
    return InHomeState();
  }
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  List<Object> get props => ["ErrorHomeState"];

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }
}
