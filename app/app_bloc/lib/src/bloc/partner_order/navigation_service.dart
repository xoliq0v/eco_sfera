// order_notification_model.dart
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class OrderNotification {
  final int id;
  final String driverName;
  final String latitude;
  final String longitude;
  final String comment;
  final Partner? partner;

  OrderNotification({
    required this.id,
    required this.driverName,
    required this.latitude,
    required this.longitude,
    required this.comment,
    this.partner,
  });

  factory OrderNotification.fromJson(Map<String, dynamic> json) {
    final orderData = json['order'] as Map<String, dynamic>;
    return OrderNotification(
      id: (orderData['id'] as num).toInt(),
      driverName: orderData['driver_name'].toString(),
      latitude: orderData['latitude'].toString(),
      longitude: orderData['longitude'].toString(),
      comment: orderData['comment'].toString(),
      partner: orderData['partner'] != null 
          ? Partner.fromJson(orderData['partner'] as Map<String, dynamic>) 
          : null,
    );
  }
}

class Partner {
  final int? id;
  final String? nickname;
  final String? fish;
  final String? address;
  final String? province;
  final String? district;

  Partner({
    required this.id,
    required this.nickname,
    required this.fish,
    required this.address,
    required this.province,
    required this.district,
  });

  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      id: json['id'] as int?,
      nickname: (json['nickname'] as String?) ?? '',
      fish: (json['fish'] as String?) ?? '',
      address: (json['address'] as String?) ?? '',
      province: (json['province'] as String?) ?? '',
      district: (json['district'] as String?) ?? '',
    );
  }
}

// dialog_route.dart
@RoutePage()
class OrderDialogRoute extends StatelessWidget {
  final OrderNotification order;
  final Function(int) onAccept;

  const OrderDialogRoute({
    required this.order,
    required this.onAccept,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yangi buyurtma'),
      content: _OrderDialogContent(order: order, onAccept: onAccept),
    );
  }
}

@RoutePage()
class OrderBottomSheetRoute extends StatelessWidget {
  final OrderNotification order;
  final Function(int) onAccept;

  const OrderBottomSheetRoute({
    required this.order,
    required this.onAccept,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: _OrderDialogContent(order: order, onAccept: onAccept),
    );
  }
}

class _OrderDialogContent extends StatelessWidget {
  final OrderNotification order;
  final Function(int) onAccept;

  const _OrderDialogContent({
    required this.order,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Haydovchi: ${order.driverName}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (order.partner != null) ...[
          Text('Manzil: ${order.partner!.address}'),
          Text('Viloyat: ${order.partner!.province}'),
          Text('Tuman: ${order.partner!.district}'),
        ],
        const SizedBox(height: 8),
        if (order.comment.isNotEmpty)
          Text('Izoh: ${order.comment}'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: const Text('Bekor qilish'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                onAccept(order.id);
                context.router.pop();
              },
              child: const Text('Qabul qilish'),
            ),
          ],
        ),
      ],
    );
  }
}
