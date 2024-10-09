import 'package:eco_sfera/core/assets/l10n/app_localizations.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/features/reports/presntation/widget/report_item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../core/widgets/dialogs/order_bottom_sheet.dart';
import '../../../core/widgets/dialogs/report_bottom_sheet.dart';
import '../../orders/data/models/order.dart';

@RoutePage()
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  late AppLocalizations l10n;
  late Map<String,String> params;

  final list = <Order>[
    Order(title: 'Lorem ipsum is dolor set amet', description: 'Jorem ipsum dolor sit amet, consect...', distance: '2', date: '12.08.2024  13:45',fromLocation: 'Lev tolstoy ko’chasi, 16',),
  ];


  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;
    params = <String,String>{
      l10n.loadCapacity: "4 tona",
      l10n.numberOfVouchers: "5",
      l10n.theSumTotalOfTickets: "3,5m3",
      l10n.dailyWalkingDistance: "60km",
    };
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.reports),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
            return ReportItem(
              order: list[index],
              onTap: (){
                ReportBottomSheet.show(context,params);
              },
            );
          }
      )
    );
  }
}
