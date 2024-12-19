import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/pages/orders/data/models/order.dart';
import 'package:feature_home/src/pages/orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

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
  final list = <Order>[

  ];

  ValueNotifier<bool> loading = ValueNotifier(true);

  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Order> _filteredList = [];
  late LocationEntity location;

  @override
  void initState() {
    super.initState();
    _filteredList = list;
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _filteredList = list;
      }
    });
  }

  void _searchOrders(String query) {
    setState(() {
      _filteredList = list.where((order) {
        return order.title.toLowerCase().contains(query.toLowerCase()) ||
            order.description.toLowerCase().contains(query.toLowerCase()) ||
            order.fromLocation.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: _toggleSearch,
            icon: SvgPicture.asset(AppIcons.search)
        ),
        title: _isSearching ? AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: TextField(
            controller: _searchController,
            onChanged: _searchOrders,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: _toggleSearch,
              ),
            ),
          ),
        )
            : Text(LocaleKeys.orders.tr(context: context)),
        actions: _isSearching ? [] : [ IconButton(
            onPressed: () {
              FilterSheet.show(context);
            },
            icon: SvgPicture.asset(AppIcons.filter)
        )
        ],
      ),
      body: BlocListener<LocationServiceCubit,LocationServiceState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              // Show a non-dismissible loading dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return PopScope(
                    canPop: false, // Prevent dialog from being dismissed
                    child: AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator.adaptive(),
                          SizedBox(height: 16),
                          Text('Getting location...'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            error: (error) {

              // Show error dialog with option to open settings
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(LocaleKeys.locationPermission.tr(context: context)),
                    content: Text(LocaleKeys.locationAccessIsRequired.tr(context: context)),
                    actions: [
                      TextButton(
                        child: Text(LocaleKeys.openSettings.tr(context: context)),
                        onPressed: () async{
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

              context.read<OrderCubit>().getOrder(location);

            },
          );
        },
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (BuildContext context, state) {
            return state.maybeWhen(
              loading: (){
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
              error: (e){
                return RefreshIndicator(
                  onRefresh: () async {
                    return await context.read<OrderCubit>().retry(location);
                  },
                  child: Center(
                    child: Text(e),
                  ),
                );
              },
              success: (result){
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (result.isEmpty) {
                      return Center(
                        child: RefreshIndicator(
                            onRefresh: () async {
                              return await context.read<OrderCubit>().retry(location);
                            },
                            child: Text(LocaleKeys.noOrdersAvailable.tr(context: context))),
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
                                        double.parse(result[index].locations[0].longitude)
                                    ),
                                  {result[index].orderUser.name : result[index].orderUser.phoneNumber.formatUzbekPhoneNumberMap()},
                                  {result[index].orderUser.name : result[index].orderUser.id}
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              init: (){
                return Center(
                  child: CircularProgressIndicator.adaptive(),
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
                        onPressed: () async{
                          await openAppSettings();
                          if(await Permission.location.isGranted){
                            context.read<LocationServiceCubit>().getLocation();
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