import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/dialogs/admission_sheet.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../orders/data/models/order.dart';
import '../../orders/presentation/widgets/order_item.dart';

@RoutePage()
class AdmissionsHistoryPage extends StatefulWidget {
  const AdmissionsHistoryPage({super.key});

  @override
  State<AdmissionsHistoryPage> createState() => _AdmissionsHistoryPageState();
}

class _AdmissionsHistoryPageState extends State<AdmissionsHistoryPage> {

  final list = <Order>[
    Order(title: 'Lorem ipsum is dolor set amet', description: 'Jorem ipsum dolor sit amet, consect...', distance: '2', date: '12.08.2024  13:45',fromLocation: 'Lev tolstoy ko’chasi, 16'),
  ];


  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.admissionsHistory,),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context,index){
            return OrderItem(
                order: list[0],
              onTap: (){
                AdmissionSheet.show(context);
              },
            );
          }
      ),
    );
  }
}
