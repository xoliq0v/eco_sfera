
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/pages/orders/data/models/order.dart';
import 'package:feature_home/src/pages/orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});

  final list = <Order>[
    const Order(title: 'Lorem ipsum is dolor set amet', description: 'Jorem ipsum dolor sit amet, consect...', distance: '2', date: '12.08.2024  13:45',fromLocation: 'Lev tolstoy ko’chasi, 16'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.orders.tr(context: context),),
      ),
      body: ListView.builder(
        itemCount: 3,
          itemBuilder: (context,index){
            return OrderItem(
                order: list[0],
              onTap: (){
                OrderBottomSheet.show(context,list[0].fromLocation);
              },
            );
          }
      ),
    );
  }
}
