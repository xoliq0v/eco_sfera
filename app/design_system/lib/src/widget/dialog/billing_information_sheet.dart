import 'package:core/core.dart';
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
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                    ), child: Center(child: Text(LocaleKeys.noDataAvailable.tr(context: context))))
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                      ),
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
                            Expanded(child: Text(key, style: Theme.of(context).textTheme.bodyLarge)),
                            Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.end)),
                          ],
                        ),
                      );
                      },),
                  ),
            ),
          ],
        );
      }
    );
  }
}