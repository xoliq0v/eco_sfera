import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'navigation_state.dart';

part 'navigation_event.dart';
part 'navigation_bloc.freezed.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<ToggleItemsSet>((event, emit) {
      emit(state.copyWith(showAlternateItems: event.showAlternateItems));
    });
  }
}
