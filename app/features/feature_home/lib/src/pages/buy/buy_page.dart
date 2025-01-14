// //
// // import 'dart:developer';
// //
// // import 'package:app_bloc/app_bloc.dart';
// // import 'package:core/core.dart';
// // import 'package:design_system/design_system.dart';
// // import 'widget/drop_down.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:model/model.dart';
// // import 'package:navigation/navigation.dart';
// //
// // enum BuyType {
// //   home,
// //   point
// // }
// //
// // @RoutePage()
// // class BuyPage extends StatefulWidget implements AutoRouteWrapper {
// //   final OrderModel? param;
// //   final String? type;
// //   const BuyPage({super.key, this.param, this.type});
// //
// //   @override
// //   State<BuyPage> createState() => _BuyPageState();
// //
// //   @override
// //   Widget wrappedRoute(BuildContext context) {
// //     return MultiBlocProvider(
// //       providers: [
// //         BlocProvider<CustomerPaginationCubit>(
// //           create: (_) => AppBlocHelper.getCustomerPaginationCubit(),
// //         ),
// //         BlocProvider<PostCustomerCubit>(
// //           create: (_) => AppBlocHelper.getPostCustomerCubit(),
// //         ),
// //         BlocProvider<BuyCubit>(
// //           create: (_) => AppBlocHelper.getBuyCubit(),
// //         ),
// //       ],
// //       child: this,
// //     );
// //   }
// // }
// //
// // class _BuyPageState extends State<BuyPage> {
// //
// //   late BuyModel param;
// //
// //   String dropDownSelection = '';
// //
// //   final Map<int, double> _values = {};
// //   double _totalKg = 0;
// //   double _totalSum = 0;
// //
// //   void _updateTotals(List<TrashInfo> params) {
// //     double totalKg = 0;
// //     double totalSum = 0;
// //     double plasticKg = 0;
// //     double plasticBottleKg = 0;
// //     double cartonKg = 0;
// //     double paperKg = 0;
// //
// //     _values.forEach((index, kg) {
// //       totalKg += kg;
// //       if (index < params.length) {
// //         double pricePerKg = params[index].price.toDouble() ?? 0;
// //         totalSum += kg * pricePerKg;
// //
// //         switch (params[index].key) {
// //           case 'plastic':
// //             plasticKg += kg;
// //             break;
// //           case 'plastic_bottle':
// //             plasticBottleKg += kg;
// //             break;
// //           case 'carton':
// //             cartonKg += kg;
// //             break;
// //           case 'paper':
// //             paperKg += kg;
// //             break;
// //         }
// //       }
// //     });
// //
// //     setState(() {
// //       _totalKg = totalKg;
// //       _totalSum = totalSum;
// //       // Update other values here if needed
// //     });
// //   }
// //
// //   void _handleTextChange(int index, String value, List<TrashInfo> params) {
// //     double? parsedValue = double.tryParse(value);
// //     _values[index] = parsedValue ?? 0;
// //     _updateTotals(params);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var colorScheme = Theme.of(context).colorScheme;
// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         title: Text(LocaleKeys.buy.tr(context: context)),
// //         leadingWidth: 125,
// //         leading: Padding(
// //           padding: const EdgeInsets.only(
// //               top: 10,
// //               left: 10
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(LocaleKeys.totalBalance.tr(context: context),style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 13),),
// //               Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
// //             ],
// //           ),
// //         ),
// //       ),
// //       body: BlocBuilder<BuyCubit,BuyState>(
// //         builder: (context,state) {
// //           return state.maybeMap(
// //             loading: (a){
// //               return Center(
// //                 child: CircularProgressIndicator.adaptive(),
// //               );
// //             },
// //             error: (e){
// //               return Center(
// //                 child: Text(e.error),
// //               );
// //             },
// //             success: (params){
// //               return SafeArea(
// //                 child: CustomScrollView(
// //                   slivers: [
// //                     SliverToBoxAdapter(
// //                       child: 20.verticalSpace,
// //                     ),
// //                     SliverToBoxAdapter(
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                         child: EcoTextField(
// //                           topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
// //                           width: double.maxFinite,
// //                           radius: 10,
// //                         ),
// //                       ),
// //                     ),
// //                     SliverToBoxAdapter(
// //                       child: 20.verticalSpace,
// //                     ),
// //                     BlocBuilder<CustomerPaginationCubit,CustomerPaginationState>(
// //                         builder: (context, state) {
// //                           return widget.param == null ? CustomDropDown(
// //                             padding: const EdgeInsets.only(left: 16),
// //                             topText: LocaleKeys.customer.tr(context: context),
// //                             initialSelection: dropDownSelection,
// //                             isLoading: state.isLoadingShimmer,
// //                             onLoadMore: () async {
// //                               await context.read<CustomerPaginationCubit>().getCustomer();
// //                             },
// //                             items: state.customers.map((value){ return value.name; }).toList(),
// //                             onChanged: (value){
// //                               dropDownSelection = value??'';
// //                             },
// //                             onAddCustomer:  () async{
// //                               final result = await NavigationUtils.getMainNavigator().navigateAddCustomerPage();
// //                               if(result != null){
// //                                 setState(() {
// //                                   state.customers.add(Customer(id: int.parse(result.id.toString()), name: result.name.toString()));
// //                                   dropDownSelection = result.name.toString();
// //                                 });
// //                               }else{
// //                                 log("NULL");
// //                               }
// //                             },
// //                           ) : EcoDropdownMenu(
// //                               padding: const EdgeInsets.only(left: 16),
// //                               placeholderText: widget.param!.orderUser.name,
// //                               onChanged:  null
// //                           );
// //                         }
// //                     ).toBoxAdapter(),
// //                     SliverToBoxAdapter(
// //                       child: 20.verticalSpace,
// //                     ),
// //                     SliverList(
// //                       delegate: SliverChildBuilderDelegate(
// //                             (BuildContext context, int index) {
// //                           if (params.params == null || index >= params.params.length) {
// //                             return null;
// //                           }
// //
// //                           return Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.end,
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               children: [
// //                                 Expanded(
// //                                   flex: 2,
// //                                   child: EcoTextField(
// //                                     key: Key('param_textfield_$index'),
// //                                     topRightText: context.getLocalization({
// //                                       'uz': params.params[index].name,
// //                                       'ru': params.params[index].nameRu,
// //                                       'en': params.params[index].nameKr,
// //                                     }) ?? '',
// //                                     keyboardType: TextInputType.numberWithOptions(decimal: true),
// //                                     inputFormatters: [
// //                                       FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
// //                                     ],
// //                                     onChanged: (value) => _handleTextChange(
// //                                         index, value ?? '0',
// //                                         params.params
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Flexible(
// //                                   child: Container(
// //                                     padding: const EdgeInsets.all(12),
// //                                     margin: const EdgeInsets.only(left: 15),
// //                                     alignment: Alignment.center,
// //                                     decoration: BoxDecoration(
// //                                       border: Border.all(
// //                                         color: colorScheme.surface,
// //                                         width: 2,
// //                                       ),
// //                                       borderRadius: BorderRadius.circular(10),
// //                                     ),
// //                                     child: Text(
// //                                       '${params.params[index].price} sum',
// //                                     ),
// //                                   ),
// //                                 )
// //                               ],
// //                             ),
// //                           );
// //                         },
// //                         childCount: params.params.length,
// //                       ),
// //                     ),
// //                     SliverToBoxAdapter(
// //                       child: 20.verticalSpace,
// //                     ),
// //                     SliverToBoxAdapter(
// //                       child: Padding(
// //                         padding: const EdgeInsets.only(left: 16,right: 16),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   'Jami  ${ widget.param == null ? _totalKg.toStringAsFixed(2) : widget.param?.totalKg} kg',
// //                                   style: Theme.of(context).textTheme.headlineSmall,
// //                                 ),
// //                                 Text(
// //                                   '${widget.param == null ? _totalSum.toInt().sumFormat()  : (double.tryParse(widget.param?.totalPrice ?? '0')?.toInt() ?? 0).sumFormat()} sum',
// //                                   style: Theme.of(context).textTheme.displayMedium?.copyWith(
// //                                       fontSize: 18
// //                                   ),
// //                                 )
// //                               ],
// //                             ),
// //                             EcoButton(
// //                                 width: 180,
// //                                 backgroundColor: colorScheme.secondary,
// //                                 height: 65,
// //                                 borderRadius: 40,
// //                                 onPressed: () {
// //                                   bool hasError = false;
// //                                   String errorMessage = '';
// //
// //                                   // Check if employee is selected
// //                                   if (dropDownSelection.isEmpty) {
// //                                     hasError = true;
// //                                     errorMessage = 'LocaleKeys.employeeRequired.tr(context: context)';
// //                                   }
// //
// //                                   // Check if dropdown is selected
// //                                   if (dropDownSelection.isEmpty && widget.param == null) {
// //                                     hasError = true;
// //                                     errorMessage = 'LocaleKeys.customerRequired.tr(context: context)';
// //                                   }
// //
// //                                   // Check if at least one field is filled
// //                                   bool hasAnyValue = false;
// //                                   for (int i = 0; i < params.params.length; i++) {
// //                                     if ((_values[i] ?? 0) > 0) {
// //                                       hasAnyValue = true;
// //                                       break;
// //                                     }
// //                                   }
// //
// //                                   if (!hasAnyValue) {
// //                                     hasError = true;
// //                                     errorMessage = 'LocaleKeys.fillAtLeastOne.tr(context: context)';
// //                                   }
// //
// //                                   if (hasError) {
// //                                     ScaffoldMessenger.of(context).showSnackBar(
// //                                       SnackBar(content: Text(errorMessage)),
// //                                     );
// //                                     return;
// //                                   }
// //
// //                                   // Get customer ID
// //                                   final int customerId;
// //                                   if (widget.param != null) {
// //                                     customerId = widget.param!.orderUser.id;
// //                                   } else {
// //                                     final selectedCustomer = context
// //                                         .read<CustomerPaginationCubit>()
// //                                         .state
// //                                         .customers
// //                                         .firstWhere((c) => c.name == dropDownSelection);
// //                                     customerId = selectedCustomer.id;
// //                                   }
// //
// //                                   // Create Buy model
// //                                   final buy = BuyReq(
// //                                     employee: dropDownSelection,
// //                                     customerId: customerId,
// //                                     paperKg: _values[0] ?? 0,
// //                                     paperPrice: params.params[0].price.toDouble() ?? 0,
// //                                     plasticKg: _values[1] ?? 0,
// //                                     plasticPrice: params.params[1].price.toDouble() ?? 0,
// //                                     plasticBottleKg: _values[2] ?? 0,
// //                                     plasticBottlePrice: params.params[2].price.toDouble() ?? 0,
// //                                     cartonKg: _values[3] ?? 0,
// //                                     cartonPrice: params.params[3].price.toDouble() ?? 0,
// //                                     totalKg: _totalKg,
// //                                     totalPrice: _totalSum,
// //                                     type: widget.type ?? 'from_home',
// //                                   );
// //
// //                                   navigatePaymentPage(buy);
// //                                 },
// //                                 child: Text(LocaleKeys.acceptance.tr(),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     SliverToBoxAdapter(
// //                       child: AppScreen.bottomNavBarHeight.verticalSpace,
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             },
// //               orElse: (){
// //                 return Center(
// //                   child: Text('Please try again later.'),
// //                 );
// //               }
// //           );
// //
// //         }
// //       ),
// //     );
// //   }
// //
// //   Future<void> navigatePaymentPage(BuyReq param) async{
// //     return NavigationUtils.getMainNavigator().navigatePaymentPage(param);
// //   }
// // }
// //
//
// import 'package:app_bloc/app_bloc.dart';
// import 'package:core/core.dart';
// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:model/model.dart';
// import 'package:navigation/navigation.dart';
// import 'widget/drop_down.dart';
//
// @RoutePage()
// class BuyPage extends StatefulWidget implements AutoRouteWrapper {
//   final OrderModel? param;
//   final HistoryModel? historyOrder;
//   final String? type;
//
//   const BuyPage({super.key, this.param, this.type, this.historyOrder});
//
//   @override
//   State<BuyPage> createState() => _BuyPageState();
//
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CustomerPaginationCubit>(
//           create: (_) => AppBlocHelper.getCustomerPaginationCubit(),
//         ),
//         BlocProvider<PostCustomerCubit>(
//           create: (_) => AppBlocHelper.getPostCustomerCubit(),
//         ),
//         BlocProvider<BuyCubit>(
//           create: (_) => AppBlocHelper.getBuyCubit(),
//         ),
//       ],
//       child: this,
//     );
//   }
// }
//
// class _BuyPageState extends State<BuyPage> {
//   String dropDownSelection = '';
//   final Map<String, double> _values = {};
//   double _totalKg = 0;
//   double _totalSum = 0;
//
//   void _updateTotals(List<TrashInfo> params) {
//     double totalKg = 0;
//     double totalSum = 0;
//
//     _values.forEach((name, kg) {
//       totalKg += kg;
//       final trashInfo = params.firstWhere(
//             (element) => element.name == name,
//         orElse: () => TrashInfo(price: 0, name: '', nameRu: '', nameKr: '', id: 0, key: ''),
//       );
//       totalSum += kg * (trashInfo.price.toDouble() ?? 0);
//     });
//
//     setState(() {
//       _totalKg = totalKg;
//       _totalSum = totalSum;
//     });
//   }
//
//   void _handleTextChange(String name, String value, List<TrashInfo> params) {
//     double? parsedValue = double.tryParse(value);
//     _values[name] = parsedValue ?? 0;
//     _updateTotals(params);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.param != null) {
//       // Initialize values from OrderItemModel if available
//       for (var item in widget.param!.items ?? []) {
//         if (item is OrderItemModel) {
//           _values[item.name] = item.kg;
//         }
//       }
//     } else if (widget.historyOrder != null) {
//       // Initialize values from HistoryModel using TrashInfo keys
//       final history = widget.historyOrder!;
//
//       // Map using the standard keys from TrashInfo
//       final Map<String, double> kgMap = {
//         'paper': history.paperKg.toDouble(),
//         'plastic_bottle': history.plasticBottleKg.toDouble(),
//         'carton': history.cartonKg.toDouble(),
//         'plastic': history.plasticKg.toDouble(),
//       };
//
//       // Initialize _values using the mapped values
//       context.read<BuyCubit>().state.maybeMap(
//         success: (state) {
//           for (var trash in state.params) {
//             if (kgMap.containsKey(trash.key)) {
//               _values[trash.name] = kgMap[trash.key]!;
//             }
//           }
//         },
//         orElse: () {},
//       );
//
//       // Update totals
//       setState(() {
//         _totalKg = history.totalKg.toDouble();
//         _totalSum = double.tryParse(history.totalPrice) ?? 0;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var colorScheme = Theme.of(context).colorScheme;
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(LocaleKeys.buy.tr(context: context)),
//         leadingWidth: 125,
//         leading: Padding(
//           padding: const EdgeInsets.only(top: 10, left: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 LocaleKeys.totalBalance.tr(context: context),
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 13),
//               ),
//               Text(
//                 '0sum',
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: BlocBuilder<BuyCubit, BuyState>(
//         builder: (context, state) {
//           return state.maybeMap(
//             loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
//             error: (e) => Center(child: Text(e.error)),
//             success: (params) => _buildSuccessState(context, params.params, colorScheme,widget.historyOrder),
//             orElse: () => Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Please try again later.'),
//                 ElevatedButton(onPressed: () async{
//                   await context.read<BuyCubit>().fetchParams();
//                 }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildSuccessState(BuildContext context, List<TrashInfo> params, ColorScheme colorScheme,HistoryModel? order) {
//     return SafeArea(
//       child: CustomScrollView(
//         slivers: [
//           const SliverToBoxAdapter(child: SizedBox(height: 20)),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: EcoTextField(
//                 topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
//                 width: double.maxFinite,
//                 initialValue: '',
//                 radius: 10,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(child: SizedBox(height: 20)),
//           _buildCustomerDropdown().toBoxAdapter(),
//           const SliverToBoxAdapter(child: SizedBox(height: 20)),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                 if (index >= params.length) return null;
//
//                 final item = params[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: EcoTextField(
//                           key: Key('param_textfield_${item.name}'),
//                           topRightText: context.getLocalization({
//                             'uz': item.name,
//                             'ru': item.nameRu,
//                             'en': item.nameKr,
//                           }) ?? '',
//                           initialValue: _values[item.name]?.toString() ?? '',
//                           keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
//                           ],
//                           onChanged: (value) => _handleTextChange(item.name, value ?? '0', params),
//                         ),
//                       ),
//                       Flexible(
//                         child: Container(
//                           padding: const EdgeInsets.all(12),
//                           margin: const EdgeInsets.only(left: 15),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: colorScheme.surface, width: 2),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text('${item.price} sum'),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//               childCount: params.length,
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: _buildTotalSection(context, colorScheme, params, order),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: AppScreen.bottomNavBarHeight.verticalSpace,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCustomerDropdown() {
//     return BlocBuilder<CustomerPaginationCubit, CustomerPaginationState>(
//       builder: (context, state) {
//         if (widget.param != null) {
//           return EcoDropdownMenu(
//             padding: const EdgeInsets.only(left: 16),
//             placeholderText: widget.param!.orderUser.name,
//             onChanged: null,
//           );
//         }
//
//         return CustomDropDown(
//           padding: const EdgeInsets.only(left: 16),
//           topText: LocaleKeys.customer.tr(context: context),
//           initialSelection: dropDownSelection,
//           isLoading: state.isLoadingShimmer,
//           onLoadMore: () async {
//             await context.read<CustomerPaginationCubit>().getCustomer();
//           },
//           items: state.customers.map((value) => value.name).toList(),
//           onChanged: (value) {
//             setState(() {
//               dropDownSelection = value ?? '';
//             });
//           },
//           onAddCustomer: () async {
//             final result = await NavigationUtils.getMainNavigator().navigateAddCustomerPage();
//             if (result != null) {
//               setState(() {
//                 state.customers.add(
//                   Customer(
//                     id: int.parse(result.id.toString()),
//                     name: result.name.toString(),
//                   ),
//                 );
//                 dropDownSelection = result.name.toString();
//               });
//             }
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildTotalSection(BuildContext context, ColorScheme colorScheme, List<TrashInfo> params,HistoryModel? order) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Jami ${widget.param?.totalKg ?? _totalKg.toStringAsFixed(2)} kg',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             Text(
//               '${widget.param == null ? _totalSum.toInt().sumFormat() : (double.tryParse(widget.param?.totalPrice ?? '0')?.toInt() ?? 0).sumFormat()} sum',
//               style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18),
//             ),
//           ],
//         ),
//         EcoButton(
//           width: 180,
//           backgroundColor: colorScheme.secondary,
//           height: 65,
//           borderRadius: 40,
//           onPressed: () => _handleSubmit(context, params,order),
//           child: Text(
//             LocaleKeys.acceptance.tr(),
//             style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _handleSubmit(BuildContext context, List<TrashInfo> params, HistoryModel? order) {
//     if (!_validateForm(context)) return;
//
//     final customerId = _getCustomerId(context);
//     final buy = _createBuyRequest(params, customerId, order);
//     navigatePaymentPage(buy);
//   }
//
//   bool _validateForm(BuildContext context) {
//     if (dropDownSelection.isEmpty) {
//       _showError(context, 'LocaleKeys.employeeRequired.tr(context: context)');
//       return false;
//     }
//
//     if (dropDownSelection.isEmpty && widget.param == null) {
//       _showError(context, 'LocaleKeys.customerRequired.tr(context: context)');
//       return false;
//     }
//
//     if (_values.isEmpty || _values.values.every((v) => v <= 0)) {
//       _showError(context, 'LocaleKeys.fillAtLeastOne.tr(context: context)');
//       return false;
//     }
//
//     return true;
//   }
//
//   void _showError(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   int _getCustomerId(BuildContext context) {
//     if (widget.param != null) {
//       return widget.param!.orderUser.id;
//     }
//
//     final selectedCustomer = context
//         .read<CustomerPaginationCubit>()
//         .state
//         .customers
//         .firstWhere((c) => c.name == dropDownSelection);
//     return selectedCustomer.id;
//   }
//
//   BuyReq _createBuyRequest(List<TrashInfo> params, int customerId,HistoryModel? order) {
//     return BuyReq(
//       userOrderId: order?.id ?? -1,
//       employee: dropDownSelection,
//       customerId: customerId,
//       paperKg: _values['paper'] ?? 0,
//       paperPrice: params.firstWhere((p) => p.name == 'paper').price.toDouble() ?? 0,
//       plasticKg: _values['plastic'] ?? 0,
//       plasticPrice: params.firstWhere((p) => p.name == 'plastic').price.toDouble() ?? 0,
//       plasticBottleKg: _values['plastic_bottle'] ?? 0,
//       plasticBottlePrice: params.firstWhere((p) => p.name == 'plastic_bottle').price.toDouble() ?? 0,
//       cartonKg: _values['carton'] ?? 0,
//       cartonPrice: params.firstWhere((p) => p.name == 'carton').price.toDouble() ?? 0,
//       totalKg: _totalKg,
//       totalPrice: _totalSum,
//       type: widget.type ?? 'from_home',
//     );
//   }
//
//   Future<void> navigatePaymentPage(BuyReq param) async {
//     return NavigationUtils.getMainNavigator().navigatePaymentPage(param);
//   }
// }



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
  final String? type;
  const BuyPage({super.key, this.param, this.type,  this.historyOrder});

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
              Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
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
                          final historyItem = widget.historyOrder!.items.firstWhere(
                                (item) {
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
                            log('Setting value for ${trashInfo.name}: ${historyItem.kg}');
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
                              if (params.params == null || index >= params.params.length) {
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
                                          '${params.params[index].price.toInt()} sum',
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
                                        log(errorMessage);
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   SnackBar(content: Text(errorMessage)),
                                        // );
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
                                        type: widget.type ?? 'from_home',
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
