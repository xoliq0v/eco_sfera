
import 'dart:developer';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'widget/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';
import 'package:navigation/navigation.dart';

enum BuyType {
  home,
  point
}

@RoutePage()
class BuyPage extends StatefulWidget implements AutoRouteWrapper {
  final OrderModel? param;
  final String? type;
  const BuyPage({super.key, this.param, this.type});

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

  void _updateTotals(List<TrashInfo> params) {
    double totalKg = 0;
    double totalSum = 0;
    double plasticKg = 0;
    double plasticBottleKg = 0;
    double cartonKg = 0;
    double paperKg = 0;

    _values.forEach((index, kg) {
      totalKg += kg;
      if (index < params.length) {
        double pricePerKg = params[index].price.toDouble() ?? 0;
        totalSum += kg * pricePerKg;

        switch (params[index].key) {
          case 'plastic':
            plasticKg += kg;
            break;
          case 'plastic_bottle':
            plasticBottleKg += kg;
            break;
          case 'carton':
            cartonKg += kg;
            break;
          case 'paper':
            paperKg += kg;
            break;
        }
      }
    });

    setState(() {
      _totalKg = totalKg;
      _totalSum = totalSum;
      // Update other values here if needed
    });
  }

  void _handleTextChange(int index, String value, List<TrashInfo> params) {
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
                          return widget.param == null ? CustomDropDown(
                            padding: const EdgeInsets.only(left: 16),
                            topText: LocaleKeys.customer.tr(context: context),
                            initialSelection: dropDownSelection,
                            isLoading: state.isLoadingShimmer,
                            onLoadMore: () async {
                              await context.read<CustomerPaginationCubit>().getCustomer();
                            },
                            items: state.customers.map((value){ return value.name; }).toList(),
                            onChanged: (value){
                              dropDownSelection = value??'';
                            },
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
                                    topRightText: context.getLocalization({
                                      'uz': params.params[index].name,
                                      'ru': params.params[index].nameRu,
                                      'en': params.params[index].nameKr,
                                    }) ?? '',
                                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                                    ],
                                    onChanged: (value) => _handleTextChange(
                                        index, value ?? '0',
                                        params.params
                                    ),
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
                                      '${params.params[index].price} sum',
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
                                onPressed: () {
                                  bool hasError = false;
                                  String errorMessage = '';

                                  // Check if employee is selected
                                  if (dropDownSelection.isEmpty) {
                                    hasError = true;
                                    errorMessage = 'LocaleKeys.employeeRequired.tr(context: context)';
                                  }

                                  // Check if dropdown is selected
                                  if (dropDownSelection.isEmpty && widget.param == null) {
                                    hasError = true;
                                    errorMessage = 'LocaleKeys.customerRequired.tr(context: context)';
                                  }

                                  // Check if at least one field is filled
                                  bool hasAnyValue = false;
                                  for (int i = 0; i < params.params.length; i++) {
                                    if ((_values[i] ?? 0) > 0) {
                                      hasAnyValue = true;
                                      break;
                                    }
                                  }

                                  if (!hasAnyValue) {
                                    hasError = true;
                                    errorMessage = 'LocaleKeys.fillAtLeastOne.tr(context: context)';
                                  }

                                  if (hasError) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(errorMessage)),
                                    );
                                    return;
                                  }

                                  // Get customer ID
                                  final int customerId;
                                  if (widget.param != null) {
                                    customerId = widget.param!.orderUser.id;
                                  } else {
                                    final selectedCustomer = context
                                        .read<CustomerPaginationCubit>()
                                        .state
                                        .customers
                                        .firstWhere((c) => c.name == dropDownSelection);
                                    customerId = selectedCustomer.id;
                                  }

                                  // Create Buy model
                                  final buy = BuyReq(
                                    employee: dropDownSelection,
                                    customerId: customerId,
                                    paperKg: _values[0] ?? 0,
                                    paperPrice: params.params[0].price.toDouble() ?? 0,
                                    plasticKg: _values[1] ?? 0,
                                    plasticPrice: params.params[1].price.toDouble() ?? 0,
                                    plasticBottleKg: _values[2] ?? 0,
                                    plasticBottlePrice: params.params[2].price.toDouble() ?? 0,
                                    cartonKg: _values[3] ?? 0,
                                    cartonPrice: params.params[3].price.toDouble() ?? 0,
                                    totalKg: _totalKg,
                                    totalPrice: _totalSum,
                                    type: widget.type ?? 'from_home',
                                  );

                                  navigatePaymentPage(buy);
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

  Future<void> navigatePaymentPage(BuyReq param) async{
    return NavigationUtils.getMainNavigator().navigatePaymentPage(param);
  }
}

