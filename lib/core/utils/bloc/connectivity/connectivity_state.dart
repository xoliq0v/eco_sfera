import 'package:equatable/equatable.dart';

import 'connectivity_cubit.dart';

class ConnectivityState extends Equatable {
  final ConnectivityStatus status;
  const ConnectivityState({required this.status});

  @override
  List<Object?> get props => [status];
}