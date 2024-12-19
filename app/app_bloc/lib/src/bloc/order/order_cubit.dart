import 'dart:math';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'order_cubit.freezed.dart';
part  'order_state.dart';

class OrderCubit extends Cubit<OrderState>{
  OrderCubit(
      this.getOrderUseCase
      ) : super(OrderState.init());

  final GetOrder getOrderUseCase;

  Future<void> getOrder(LocationEntity location) async{

    emit(OrderState.loading());

    final result = await getOrderUseCase.get();

    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {

      final value = await result.data?.map((data){

        if(data.locations.isEmpty) return data;

        return data.copyWith(distance: calculateDistance(location, double.parse(data.locations[0].latitude), double.parse(data.locations[0].longitude)));

      }).toList();

      emit(OrderState.success( value ?? [] ));
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }

  }

  double calculateDistance(LocationEntity userLocation, double orderLat, double orderLon) {
    const double earthRadius = 6371; // kilometers

    // Convert degrees to radians
    double degreesToRadians(double degrees) => degrees * (pi / 180);

    double dLat = degreesToRadians(orderLat - userLocation.latitude);
    double dLon = degreesToRadians(orderLon - userLocation.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(userLocation.latitude)) *
            cos(degreesToRadians(orderLat)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  Future<void> retry(LocationEntity location)async{
    final result = await getOrderUseCase.get();

    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {

      final value = await result.data?.map((data){

        return data.copyWith(distance: calculateDistance(location, double.parse(data.locations[0].latitude), double.parse(data.locations[0].longitude)));

      }).toList();

      emit(OrderState.success( value ?? [] ));

    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }

}