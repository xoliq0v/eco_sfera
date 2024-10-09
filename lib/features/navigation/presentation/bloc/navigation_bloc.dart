import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.dart';
part 'navigation_bloc.freezed.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void setTab(int index) => emit(index);
}