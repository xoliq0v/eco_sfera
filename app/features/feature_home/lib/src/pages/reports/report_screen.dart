

import 'package:core/core.dart' hide Order;
import 'package:flutter/material.dart';

import '../orders/data/models/order.dart';
import 'widget/report_item.dart';

@RoutePage()
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  late Map<String,String> params;

  final list = <Order>[
    const Order(title: 'Lorem ipsum is dolor set amet', description: 'Jorem ipsum dolor sit amet, consect...', distance: '2', date: '12.08.2024  13:45',fromLocation: 'Lev tolstoy ko’chasi, 16',),
  ];


  @override
  Widget build(BuildContext context) {
    params = <String,String>{
      LocaleKeys.loadCapacity.tr(context: context): "4 tona",
      LocaleKeys.numberOfVouchers.tr(context: context): "5",
      LocaleKeys.theSumTotalOfTickets.tr(context: context): "3,5m3",
      LocaleKeys.dailyWalkingDistance.tr(context: context): "60km",
    };
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.reports.tr(context: context)),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
            return ReportItem(
              order: list[index],
              onTap: (){
                // ReportBottomSheet.show(context,params);
              },
            );
          }
      )
    );
  }
}
