import 'package:bloc_demo/main_export.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectivityChanged extends ConnectivityEvent {
  final List<ConnectivityResult> result;

  const ConnectivityChanged(this.result);

  @override
  List<Object> get props => [result];
}
