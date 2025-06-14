

import 'package:bloc_demo/main_export.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late StreamSubscription _subscription;

  ConnectivityBloc(this._connectivity) : super(ConnectivityInitial()) {
    on<ConnectivityChanged>((event, emit) {
      if (event.result.contains(ConnectivityResult.none)) {
        emit(ConnectivityOffline());
      } else {
        emit(ConnectivityOnline());
      }
    });

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChanged(result));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
