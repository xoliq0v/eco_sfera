import 'package:flutter/material.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';


class ReportBottomSheet extends StatelessWidget {
  final Map<String, String>? list;

  const ReportBottomSheet({Key? key, this.list}) : super(key: key);

  static void show(BuildContext context, Map<String, String>? list) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ReportBottomSheet(list: list),
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
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(250),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Lev tolstoy kochasi,16',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18
                  ),),
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