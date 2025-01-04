import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';
import 'widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

part 'widgets/search.dart';

@RoutePage()
class OrdersPage extends StatefulWidget implements AutoRouteWrapper {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>(
          create: (_) => AppBlocHelper.getOrderCubit(),
        ),
        BlocProvider<LocationServiceCubit>(
          create: (_) => AppBlocHelper.getLocationServiceCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _OrdersPageState extends State<OrdersPage> {
  ValueNotifier<bool> loading = ValueNotifier(true);
  ValueNotifier<bool> readyGetOrder = ValueNotifier(false);
  final TextEditingController _searchController = TextEditingController();
  late LocationEntity location;

  @override
  void initState() {
    super.initState();
  }

  void _searchOrders(String query) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.colorScheme.background,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
              onTap: (){
                NavigationUtils.getMainNavigator().navigateProfilePage();
              },
              child: PriceBadge()),
        ),
        leadingWidth: 120,
        title: Text(LocaleKeys.orders.tr(context: context)),
        actions: [
          ValueListenableBuilder(
            valueListenable: readyGetOrder,
            builder: (context,value,child){ {
              return readyGetOrder.value ? DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(50),
                ),
                  child: IconButton(
                    onPressed: () {
                      context.read<LocationServiceCubit>().init();
                      context.read<OrderCubit>().init();
                    },
                    icon: Icon(Icons.power_settings_new_outlined,color: context.colorScheme.cardColor,),
                  ),
                ) : SizedBox.shrink();
              }
            },
          ),
          10.horizontalSpace
        ],
      ),
      body: BlocListener<LocationServiceCubit, LocationServiceState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              // Show a non-dismissible loading dialog
              // return showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   builder: (BuildContext context) {
              //     return PopScope(
              //       canPop: false, // Prevent dialog from being dismissed
              //       child: AlertDialog(
              //         content: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             CircularProgressIndicator.adaptive(),
              //             SizedBox(height: 16),
              //             Text('Getting location...'),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // );
            },
            error: (error) {
              // Show error dialog with option to open settings
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(LocaleKeys.locationPermission.tr(context: context)),
                    content: Text(error.toString()),
                    actions: [
                      TextButton(
                        child: Text(LocaleKeys.openSettings.tr(context: context)),
                        onPressed: () async {
                          // Use a method to open app settings
                          // This is a placeholder - replace with actual method
                          await openAppSettings();
                          // if(await Permission.location.isGranted){
                          //   context.read<LocationServiceCubit>().getLocation();
                          // }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            success: (location) {
              this.location = location;
              readyGetOrder.value = true;
              context.read<OrderCubit>().getOrder(location);
            },
            init: (){
              readyGetOrder.value = false;
            }
          );
        },
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (BuildContext context, state) {
            return state.maybeWhen(
              loading: () {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
              error: (e) {
                return RefreshIndicator(
                  onRefresh: () async {
                    return await context.read<OrderCubit>().retry(location);
                  },
                  child: Center(
                    child: Text(e),
                  ),
                );
              },
              success: (result, locationEntry) {
                readyGetOrder.value = true;
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (result.isEmpty) {
                      return Center(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            return await context.read<OrderCubit>().retry(location);
                          },
                          child: Text(LocaleKeys.noOrdersAvailable.tr(context: context)),
                        ),
                      );
                    }

                    if (constraints.maxWidth > 600) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: result.length,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return OrderItem(
                            order: result[index],
                            onTap: () {
                              AdmissionSheet.show(context);
                            },
                          );
                        },
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () async {
                        return await context.read<OrderCubit>().retry(location);
                      },
                      child: Column(
                        children: [
                          _OrderSearch(
                            searchController: _searchController,
                            onChanged: _searchOrders,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: result.length,
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: OrderItem(
                                    order: result[index],
                                    isNew: index == 0,
                                    onTap: () {
                                      OrderSheet.show(
                                        context,
                                        Coords(
                                          double.parse(result[index].locations[0].latitude),
                                          double.parse(result[index].locations[0].longitude),
                                        ),
                                        {result[index].orderUser.name: result[index].orderUser.phoneNumber.formatUzbekPhoneNumberMap()},
                                        result[index],
                                      );
                                    },
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
              },
                init: (){
                  readyGetOrder.value = false;
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SliderButton(
                        width: double.maxFinite,
                        backgroundColor: context.colorScheme.surface,
                        label: Text(
                            LocaleKeys.getOrder.tr(context: context),
                        ),
                        alignLabel: Alignment.center,
                        action: () async{
                          await context.read<LocationServiceCubit>().getLocation();
                        },
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: context.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(Icons.arrow_forward,color: context.colorScheme.cardColor,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              orElse: () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.locationAccessIsRequired.tr(context: context)),
                    TextButton(
                      child: Text(LocaleKeys.openSettings.tr(context: context)),
                      onPressed: () async {
                        await openAppSettings();
                        if (await Permission.location.isGranted) {
                          await context.read<LocationServiceCubit>().getLocation();
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}