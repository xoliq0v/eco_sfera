// import 'package:eco_sfera/core/extension/localization_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
//
// class BillingInformationSheet {
//   static void show(BuildContext context,Map<String,String>? list) {
//     var l10n = context.l10n;
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       barrierColor: Colors.grey.withOpacity(0.85),
//       builder: (context) {
//         return IntrinsicHeight(
//           child: Column(
//             children: [
//               Container(
//                 width: 100,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: BorderRadius.circular(250),
//                 ),
//               ),
//               const Gap(10),
//               Container(
//                 // height: MediaQuery.sizeOf(context).height * 0.7,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.background,
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25)
//                     )
//                 ),
//                 child: ListView.builder(
//                     itemCount: list?.length,
//                     itemBuilder: (context,index){
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(list?.keys.elementAt(index)??'NULL KEY'),
//                             Text(list?.values.elementAt(index)??'NULL VALUE')
//                           ],
//                         ),
//                       );
//                     }
//                 )
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:flutter/material.dart';

class BillingInformationSheet extends StatelessWidget {
  final Map<String, String>? list;

  const BillingInformationSheet({Key? key, this.list}) : super(key: key);

  static void show(BuildContext context, Map<String, String>? list) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BillingInformationSheet(list: list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(250),
                ),
              ),
              Expanded(
                child: list == null || list!.isEmpty
                    ? Center(child: Text(context.l10n.noDataAvailable))
                    : ListView.builder(
                  controller: scrollController,
                  itemCount: list!.length,
                  itemBuilder: (context, index) {
                    final key = list!.keys.elementAt(index);
                    final value = list!.values.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(key, style: Theme.of(context).textTheme.bodyLarge)),
                          Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.end)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}