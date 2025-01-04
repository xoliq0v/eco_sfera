import 'dart:convert';
import 'package:model/model.dart';

extension OrderMessageParser on Map<String, dynamic> {
  OrderModel? toOrderModel() {
    try {
      final orderData = this['order'];
      if (orderData is String) {
        final decodedOrderData = json.decode(orderData) as Map<String, dynamic>;
        return _parseOrder(decodedOrderData);
      } else if (orderData is Map<String, dynamic>) {
        return _parseOrder(orderData);
      } else {
        throw 'Invalid order data format';
      }
    } catch (e) {
      print('[log] Error parsing order message: $e');
      return null;
    }
  }

  OrderModel _parseOrder(Map<String, dynamic> orderData) {
    final userData = orderData['user'] as Map<String, dynamic>;
    final user = OrderUser(
      id: userData['id'] as int,
      name: userData['name'] as String,
      phoneNumber: userData['phone_number'] as String,
    );

    final locationId = orderData['location_id'] as int?;
    final locations = <OrderLocationModel>[];
    if (locationId != null) {
      locations.add(OrderLocationModel(
        id: locationId,
        latitude: "0",
        longitude: "0",
      ));
    }

    return OrderModel(
      totalKg: orderData['total_kg'] as int,
      totalPrice: orderData['total_price'] as String,
      date: DateTime.parse(orderData['date'] as String),
      id: orderData['id'] as int,
      orderUser: user,
      locations: locations,
    );
  }
}
