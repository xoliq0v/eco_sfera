import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_dropdown_button.dart';
import 'package:eco_sfera/core/widgets/fields/eco_text_field.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';

import '../../../core/assets/theme/app_colors.dart';

@RoutePage()
class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  String? _selectedValue;
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.buy),
        leadingWidth: 125,
        leading: Padding(
          padding: const EdgeInsets.only(
              top: 10,
              left: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.totalBalance,style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 13),),
              Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Gap(20),
            ),
            SliverToBoxAdapter(
              child: EcoTextField(
                topRightText: l10n.responsibleEmployee,
                width: double.maxFinite,
                radius: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(20),
            ),
            SliverToBoxAdapter(
              child: EcoDropdownMenu(
                  padding: const EdgeInsets.only(left: 16),
                  topText: l10n.customer,
                  initialSelection: '',
                  items: [
                    DropdownMenuEntry(value: l10n.addACustomer,label: l10n.addACustomer),
                    const DropdownMenuEntry(value: 'Option',label: 'Option'),
                    const DropdownMenuEntry(value: 'Option',label: 'Option'),
                    const DropdownMenuEntry(value: 'Option',label: 'Option'),
                  ], onChanged: (value){}
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(20),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: l10n.paper,
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
            const SliverToBoxAdapter(
              child: Gap(20),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: l10n.plastic,
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
            const SliverToBoxAdapter(
              child: Gap(20),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: l10n.bakalashka,
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
            const SliverToBoxAdapter(
              child: Gap(20),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: l10n.cardboard,
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
            const SliverToBoxAdapter(
              child: Gap(20),
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
                          context.router.navigate(const PaymentRoute());
                        },
                        child: Text(l10n.acceptance)
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
}

