
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.buy.tr(context: context)),
        leadingWidth: 125,
        leading: Padding(
          padding: const EdgeInsets.only(
              top: 10,
              left: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.totalBalance,style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 13),),
              Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: EcoTextField(
                topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
                width: double.maxFinite,
                radius: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: EcoDropdownMenu(
                  padding: const EdgeInsets.only(left: 16),
                  topText: LocaleKeys.customer.tr(context: context),
                  initialSelection: '',
                  items: [
                    DropdownMenuEntry(value: LocaleKeys.addACustomer.tr(context: context),label: LocaleKeys.addACustomer.tr(context: context)),
                    const DropdownMenuEntry(value: 'Option',label: 'Option'),
                    const DropdownMenuEntry(value: 'Option',label: 'Option'),
                    const DropdownMenuEntry(value: 'Option',label: 'Option'),
                  ], onChanged: (value){}
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.paper.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.plastic.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.bakalashka.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.cardboard.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jami  14 kg',style: Theme.of(context).textTheme.headlineSmall,),
                        Text('50 000 sum',style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 18
                        ),)
                      ],
                    ),
                    EcoButton(
                        width: 180,
                        backgroundColor: colorScheme.secondary,
                        height: 65,
                        borderRadius: 40,
                        onPressed: (){
                          // context.router.navigate(const PaymentRoute());
                          navigatePaymentPage();
                        },
                        child: Text(LocaleKeys.acceptance.tr(),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> navigatePaymentPage() async{
    return NavigationUtils.getMainNavigator().navigatePaymentPage();
  }
}

