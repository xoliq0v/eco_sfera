import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

import 'connectivity_state.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityBloc extends Cubit<ConnectivityState> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityBloc() : super(const ConnectivityState(status: ConnectivityStatus.connected)) {
    final Connectivity connectivity = Connectivity();
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(const ConnectivityState(status: ConnectivityStatus.disconnected));
      } else {
        emit(const ConnectivityState(status: ConnectivityStatus.connected));
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
