import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:core/generated/locale_keys.g.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../../../di/init_route.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  Map<String, String> data = {
    LocaleKeys.paper: 'assets/icons/doc.svg',
    LocaleKeys.cardboard: 'assets/icons/box.svg',
    LocaleKeys.metal: 'assets/icons/metal.svg',
    LocaleKeys.plastic: 'assets/icons/bottle.svg',
  };

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          success: (products) => ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: InkWell(
                  onTap: () async{
                    await NavigationUtils.getMainNavigator().navigatePriceChangerPage(products[index]);
                    await context.read<ProductCubit>().getProducts();
                  },
                  child: _Item(icon: 'assets/icons/box.svg', title: products[index].name)),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error.toString())),
        );
      }
    );
  }
}


class _Item extends StatelessWidget {
  final String icon;
  final String title;
  const _Item({required this.icon, required this.title});

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
                child: SvgPicture.asset(icon,color: context.colorScheme.secondary,),
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
