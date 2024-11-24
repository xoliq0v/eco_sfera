import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_case/use_case.dart';

part 'logout_state.dart';

part 'logout_cubit.freezed.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logout) : super(const LogoutState.init());

  final Logout _logout;

  Future<void> logout() async {
    emit(const LogoutState.loading());
    final res = await _logout.logout();
    if (res.data ?? false) {
      emit(const LogoutState.success());
      return;
    }
    emit(LogoutState.error(res.error?.message ?? ''));
  }
}
