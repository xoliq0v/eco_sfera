part of '../admissions_history_page.dart';

@RoutePage()
class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {

  final List<HistoryModel> list = [
    HistoryModel(id: 9, employee: 'employee', customerId: 9, paperKg: 1, paperPrice: 1, plasticKg: 11, plasticPrice: 1, plasticBottleKg: 1, plasticBottlePrice: 1, cartonKg: 1, cartonPrice: 1, totalKg: 1, totalPrice: 1, type: 'type'),
    HistoryModel(id: 9, employee: 'employee', customerId: 9, paperKg: 1, paperPrice: 1, plasticKg: 11, plasticPrice: 1, plasticBottleKg: 1, plasticBottlePrice: 1, cartonKg: 1, cartonPrice: 1, totalKg: 1, totalPrice: 1, type: 'type'),
    HistoryModel(id: 9, employee: 'employee', customerId: 9, paperKg: 1, paperPrice: 1, plasticKg: 11, plasticPrice: 1, plasticBottleKg: 1, plasticBottlePrice: 1, cartonKg: 1, cartonPrice: 1, totalKg: 1, totalPrice: 1, type: 'type'),
    HistoryModel(id: 9, employee: 'employee', customerId: 9, paperKg: 1, paperPrice: 1, plasticKg: 11, plasticPrice: 1, plasticBottleKg: 1, plasticBottlePrice: 1, cartonKg: 1, cartonPrice: 1, totalKg: 1, totalPrice: 1, type: 'type'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: HistoryItem(history: list[index],onTap: (){
            AdmissionSheet.show(context);
          },),
        );
      },
    );;
  }
}
