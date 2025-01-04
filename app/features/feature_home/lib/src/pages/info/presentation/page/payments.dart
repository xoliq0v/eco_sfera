import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  Map<String, String> data = {
    'Qog’oz': 'assets/icons/doc.svg',
    'Karton': 'assets/icons/box.svg',
    'Matal': 'assets/icons/metal.svg',
    'Plastik': 'assets/icons/bottle.svg',
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: GestureDetector(
              onTap: (){
                NavigationUtils.getMainNavigator().navigatePriceChangerPage(data.keys.elementAt(index));
              },
              child: _Item(
                icon: data.values.elementAt(index).toString(),
                title: data.keys.elementAt(index).toString(),
              ),
            ),
          );

        }
    );
  }
}


class _Item extends StatelessWidget {
  final String icon;
  final String title;
  const _Item({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: context.colorScheme.primary.withOpacity(0.3)),
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
        child: Row(
          children: [
            DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                child: SvgPicture.asset(icon),
              ),
            ),
            10.horizontalSpace,
            Text(title)
          ],
        ),
      ),
    );
  }
}
