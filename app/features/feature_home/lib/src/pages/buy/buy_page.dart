
import 'dart:developer';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class BuyPage extends StatefulWidget implements AutoRouteWrapper {
  final OrderModel? param;
  const BuyPage({super.key, this.param});

  @override
  State<BuyPage> createState() => _BuyPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerPaginationCubit>(
          create: (_) => AppBlocHelper.getCustomerPaginationCubit(),
        ),
        BlocProvider<PostCustomerCubit>(
          create: (_) => AppBlocHelper.getPostCustomerCubit(),
        ),
        BlocProvider<BuyCubit>(
          create: (_) => AppBlocHelper.getBuyCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _BuyPageState extends State<BuyPage> {

  late BuyModel param;

  String dropDownSelection = '';

  final Map<int, double> _values = {};
  double _totalKg = 0;
  double _totalSum = 0;

  void _updateTotals(List<TrashParamModel> params) {
    double totalKg = 0;
    double totalSum = 0;

    _values.forEach((index, kg) {
      totalKg += kg;
      if (index < params.length) {
        double pricePerKg = params[index].price?.toDouble() ?? 0;
        totalSum += kg * pricePerKg;
      }
    });

    setState(() {
      _totalKg = totalKg;
      _totalSum = totalSum;
    });
  }

  void _handleTextChange(int index, String value, List<TrashParamModel> params) {
    double? parsedValue = double.tryParse(value);
    _values[index] = parsedValue ?? 0;
    _updateTotals(params);
  }

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
              Text(LocaleKeys.totalBalance.tr(context: context),style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 13),),
              Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
            ],
          ),
        ),
      ),
      body: BlocBuilder<BuyCubit,BuyState>(
        builder: (context,state) {
          return state.maybeMap(
            loading: (a){
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            error: (e){
              return Center(
                child: Text(e.error),
              );
            },
            success: (params){
              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: 20.verticalSpace,
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: EcoTextField(
                          topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
                          width: double.maxFinite,
                          radius: 10,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: 20.verticalSpace,
                    ),
                    BlocBuilder<CustomerPaginationCubit,CustomerPaginationState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: (){

                            },
                            child: widget.param == null ? EcoDropdownMenu(
                              padding: const EdgeInsets.only(left: 16),
                              topText: LocaleKeys.customer.tr(context: context),
                              initialSelection: dropDownSelection,
                              isLoading: state.isLoadingShimmer,
                              items: state.customers.map((value){ return value.name; }).toList(),
                              onChanged: (value){},
                              onAddCustomer:  () async{
                                final result = await NavigationUtils.getMainNavigator().navigateAddCustomerPage();
                                if(result != null){
                                  setState(() {
                                    state.customers.add(Customer(id: int.parse(result.id.toString()), name: result.name.toString()));
                                    dropDownSelection = result.name.toString();
                                  });
                                }else{
                                  log("NULL");
                                }
                              },
                            ) : EcoDropdownMenu(
                                padding: const EdgeInsets.only(left: 16),
                                placeholderText: widget.param!.orderUser.name,
                                onChanged:  null
                            ),
                          );
                        }
                    ).toBoxAdapter(),
                    SliverToBoxAdapter(
                      child: 20.verticalSpace,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          if (params.params == null || index >= params.params.length) {
                            return null;
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: EcoTextField(
                                    key: Key('param_textfield_$index'),
                                    topRightText: params.params[index].key ?? '',
                                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                                    ],
                                    onChanged: (value) => _handleTextChange(index, value ?? '0', params.params),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(left: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: colorScheme.surface,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '${params.params[index].price ?? 0} sum',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        childCount: params.params.length,
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
                                Text(
                                  'Jami  ${ widget.param == null ? _totalKg.toStringAsFixed(2) : widget.param?.totalKg} kg',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  '${widget.param == null ? _totalSum.toInt().sumFormat()  : (double.tryParse(widget.param?.totalPrice ?? '0')?.toInt() ?? 0).sumFormat()} sum',
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                      fontSize: 18
                                  ),
                                )
                              ],
                            ),
                            EcoButton(
                                width: 180,
                                backgroundColor: colorScheme.secondary,
                                height: 65,
                                borderRadius: 40,
                                onPressed: (){
                                  navigatePaymentPage(
                                    BuyModel(employee: 'employee', customerId: 1, paperKg: 1, paperPrice: 1, plasticKg: 1, plasticPrice: 1, plasticBottleKg: 1, plasticBottlePrice: 1, cartonKg: 1, cartonPrice: 1, totalKg: 1, totalPrice: widget.param == null ? _totalSum : double.parse(widget.param?.totalPrice ?? '0'), type: 'type')
                                  );
                                },
                                child: Text(LocaleKeys.acceptance.tr(),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AppScreen.bottomNavBarHeight.verticalSpace,
                    ),
                  ],
                ),
              );
            },
              orElse: (){
                return Center(
                  child: Text('Please try again later.'),
                );
              }
          );

        }
      ),
    );
  }

  Future<void> navigatePaymentPage(BuyModel param) async{
    return NavigationUtils.getMainNavigator().navigatePaymentPage(param);
  }
}
