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
  final ActiveHistory? historyOrder;
  final PartnerOrder? partnerOrder;
  final String? type;
  const BuyPage({super.key, this.param, this.type,  this.historyOrder, this.partnerOrder});

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
  final Map<int, TextEditingController> _controllers = {};
  double _totalKg = 0;
  double _totalSum = 0;

  TextEditingController responsible = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.historyOrder != null){
      if(widget.historyOrder?.user != null) dropDownSelection = widget.historyOrder!.user.name!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.values.forEach((controller) => controller.dispose());
  }
  
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
    _controllers[index]?.text = value; // Update controller text
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
              BlocProvider<BalanceCubit>(
                create: (context)=> AppBlocHelper.getBalanceCubit(),
                child: BlocBuilder<BalanceCubit,BalanceState>(
                  builder: (context,state) {
                    return state.maybeWhen(
                      success: (balance,user){
                        return Text(balance.formatCompact,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),);
                      },
                      orElse: (){
                        return Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),);
                      }
                    );
                    // if(state.runtimeType == BalanceState.success){
                    //   return Text(state.balance.sumFormat(),style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),);
                    // }else {
                    //   return Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),);
                    // }
                  }
                ),
              )
            ],
          ),
        ),
      ),
      body: BlocConsumer<BuyCubit,BuyState>(
          listener: (context,state){
            state.mapOrNull(
                success: (state) async {
                  await Future.delayed(Duration(seconds: 1),(){
                    if(widget.historyOrder!=null){
                      setState(() {
                        for (int i = 0; i < state.params.length; i++) {
                          final trashInfo = state.params[i];
                          final historyItem = widget.historyOrder!.items.firstWhere((item) {
                              switch(trashInfo.key) {
                                case 'paper':
                                  return item.name?.toLowerCase().contains('qog\'oz') ?? false;
                                case 'plastic_bottle':
                                  return item.name?.toLowerCase().contains('baklashka') ?? false;
                                case 'carton':
                                  return item.name?.toLowerCase().contains('karobka') ?? false;
                                case 'plastic':
                                  return item.name?.toLowerCase().contains('plastmas') ?? false;
                                default:
                                  return false;
                              }
                            },
                            orElse: () => Item(name: '', price: '0', kg: 0),
                          );

                          if (historyItem.name?.isNotEmpty ?? false) {
                            _values[i] = historyItem.kg.toDouble();
                            _controllers[i]?.text = historyItem.kg.toString();
                          }
                        }

                        _totalKg = widget.historyOrder!.totalKg.toDouble();
                        _totalSum = double.tryParse(widget.historyOrder!.totalPrice ?? '0') ?? 0;
                        _updateTotals(state.params);
                      });
                    }
                    responsible.text = '${state.user.name} ${state.user.surname}';
                  });
                }
            );
          },
          builder: (context,state) {
            return state.maybeMap(
                loading: (a){
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
                error: (e){
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(e.error),
                        EcoOutlineButton(onPressed: (){
                          context.read<BuyCubit>().fetchParams();
                        }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
                      ],
                    ),
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
                              controller: responsible,
                              initialValue: params.user.name,
                              topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
                              width: double.maxFinite,
                              readOnly: true,
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
                                initialSelection: widget.historyOrder != null ? widget.historyOrder?.user.name : dropDownSelection,
                                isLoading: state.isLoadingShimmer,
                                readOnly: widget.historyOrder != null ? true : false,
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
                              if (index >= params.params.length) {
                                return null;
                              }

                              if (!_controllers.containsKey(index)) {
                                _controllers[index] = TextEditingController();
                              }

                              if (!_controllers.containsKey(index)) {
                                _controllers[index] = TextEditingController();
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        key: Key('param_textfield_$index'),
                                        controller: _controllers[index],
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5),),
                                          filled: true,
                                          labelText: context.getLocalization({
                                            'uz': params.params[index].name,
                                            'ru': params.params[index].nameRu,
                                            'en': params.params[index].nameKr,
                                          }) ?? '',
                                          labelStyle: TextStyle(
                                            color: Theme.of(context).textTheme.headlineSmall?.color,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorScheme.secondary
                                            )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: colorScheme.surface,
                                                  width: 2,
                                              ),
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                        ),
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
                                          LocaleKeys.buySum.tr(context: context,args: [params.params[index].price.toInt().toString()]),
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
                                      // 'Jami  ${ widget.param == null ? _totalKg.toStringAsFixed(2) : widget.param?.totalKg} kg',
                                      LocaleKeys.totalPrice.tr(context: context,args: [widget.param == null ? _totalKg.toStringAsFixed(2).toString()??'' : widget.param?.totalKg.toString()??'']),
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    Text(
                                      LocaleKeys.buySum.tr(context: context,args: [widget.param == null ? _totalSum.toInt().sumFormat()  : (double.tryParse(widget.param?.totalPrice ?? '0')?.toInt() ?? 0).sumFormat()]),
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
                                        errorMessage = LocaleKeys.employeeRequired.tr(context: context);
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
                                        errorMessage = LocaleKeys.fillAtLeastOne.tr(context: context);
                                      }

                                      if (hasError) {
                                        log(errorMessage);
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
                                        if(widget.historyOrder == null){
                                          final selectedCustomer = context
                                              .read<CustomerPaginationCubit>()
                                              .state
                                              .customers
                                              .firstWhere((c) => c.name == dropDownSelection);
                                          customerId = selectedCustomer.id;
                                        }else {

                                          customerId = widget.historyOrder?.user.id ?? -1;

                                        }

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
                                        type: widget.type ?? 'from_point',
                                        userOrderId: widget.historyOrder?.id??-1,
                                      );

                                      navigatePaymentPage(buy);
                                    },
                                    child: Text(LocaleKeys.buy.tr(context: context),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
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
                    child: Text(LocaleKeys.tryAgain.tr(context: context)),
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
