import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../design_system.dart';
import '../../const/app_const.dart';

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
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                width: 100,
                height: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(250),
                  ),
                ),
              ),
            ),
            Expanded(
              child: list == null || list!.isEmpty
                  ? DecoratedBox(decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                    ), child: Center(child: Text(LocaleKeys.noDataAvailable.tr(context: context))))
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
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
                                  Expanded(child: Text(key.tr(context: context), style: Theme.of(context).textTheme.bodyLarge)),
                                  Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.end)),
                                ],
                              ),
                            );
                            },),
                          ),
                          Icon(Icons.check_circle,size: 65,color: context.colorScheme.secondary,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EcoMaterialButton(onPressed: (){
                              context.router.pop();
                            }, child: Text(LocaleKeys.done.tr(context: context))),
                          )
                        ],
                      ),
                  ),
            ),
          ],
        );
      }
    );
  }
}