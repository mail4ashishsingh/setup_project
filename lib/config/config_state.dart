import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]);

  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {
  @override
  List<Object> get props => ["UnConfigState"];

  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }
}

class InConfigState extends ConfigState {
  @override
  List<Object> get props => ["InConfigState"];

  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }
}

class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);

  @override
  List<Object> get props => ["ErrorConfigState"];

  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }
}
