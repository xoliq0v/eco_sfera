import 'dart:async';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';
import 'widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'widgets/search.dart';

@RoutePage()
class OrdersPage extends StatefulWidget implements AutoRouteWrapper {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();

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

class _OrdersPageState extends State<OrdersPage> with AutomaticKeepAliveClientMixin {
  final ValueNotifier<bool> _readyGetOrder = ValueNotifier(false);
  final TextEditingController _searchController = TextEditingController();
  late LocationEntity _location;
  // Add a Set to keep track of viewed orders
  final Set<String> _viewedOrders = {};

  // Add debouncer for search
  final _searchDebouncer = Debouncer(milliseconds: 300);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    // Initialize location service when page loads
    await Future.delayed(Duration.zero);
    if (mounted) {
      context.read<LocationServiceCubit>().init();
    }
  }

  void _searchOrders(String query) {
    _searchDebouncer.run(() {
      // Implement your search logic here
      // Use the debouncer to prevent excessive API calls
    });
  }

  Future<void> _handleRefresh() async {
    return await context.read<OrderCubit>().retry(_location);
  }

  Widget _buildOrdersList(List<OrderModel> orders) {
    if (orders.isEmpty) {
      return Center(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Text(LocaleKeys.noOrdersAvailable.tr(context: context)),
              ),
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView.builder(
        itemCount: orders.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: OrderItem(
              key: ValueKey(order.id),
              order: order,
              isNew: order.status && !_viewedOrders.contains(order.id),
              onTap: () {
                _viewedOrders.add(order.id.toString());
                _showOrderSheet(order,false);
              },
            ),
          );
        },
      ),
    );
  }

  void _showOrderSheet(OrderModel order,bool isNew) {
    order.copyWith(status: false);
    OrderSheet.show(
      onAcceptPress: () async{
        await context.read<OrderCubit>().accept(order.id);
      },
      context: context,
      coords: Coords(
        double.parse(order.locations[0].latitude),
        double.parse(order.locations[0].longitude),
      ),
      user: {order.orderUser.name: order.orderUser.phoneNumber.formatUzbekPhoneNumberMap()},
      order: order,
      isNewOrder: isNew,
    );
  }

  Widget _buildSliderButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SliderButton(
        width: double.maxFinite,
        height: 60, // Reduced height for better performance
        backgroundColor: context.colorScheme.surface,
        label: Text(LocaleKeys.getOrder.tr(context: context)),
        alignLabel: Alignment.center,
        action: () async {
          if (mounted) {
            await context.read<LocationServiceCubit>().getLocation();
          }
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.arrow_forward,
            color: context.colorScheme.cardColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.colorScheme.background,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () => NavigationUtils.getMainNavigator().navigateProfilePage(),
            child: const PriceBadge(),
          ),
        ),
        leadingWidth: 120,
        title: Text(LocaleKeys.orders.tr(context: context)),
        actions: [
          ValueListenableBuilder(
            valueListenable: _readyGetOrder,
            builder: (_, value, __) => value
                ? DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {
                  context.read<LocationServiceCubit>().init();
                  context.read<OrderCubit>().init();
                },
                icon: Icon(
                  Icons.power_settings_new_outlined,
                  color: context.colorScheme.cardColor,
                ),
              ),
            )
                : const SizedBox.shrink(),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocListener<LocationServiceCubit, LocationServiceState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (location) {
              _location = location;
              _readyGetOrder.value = true;
              context.read<OrderCubit>().getOrder(location);
            },
            error: (error) => _showLocationErrorDialog(context,error.toString()),
            init: () => _readyGetOrder.value = false,
          );
        },
        child: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            state.mapOrNull(
              success: (orders) {
                if (orders.isRealtime && orders.newOrders.isNotEmpty) {
                  _showOrderSheet(orders.newOrders[0],true);
                }
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator.adaptive()),
              error: (e) => RefreshIndicator(
                onRefresh: _handleRefresh,
                child: Center(child: Text(e)),
              ),
              success: (orders, currentLocation, isInitialFetch, isRealtime, newOrders) {
                _readyGetOrder.value = true;
                return Column(
                  children: [
                    _OrderSearch(
                      searchController: _searchController,
                      onChanged: _searchOrders,
                    ),
                    Expanded(child: _buildOrdersList(orders)),
                  ],
                );
              },
              init: () => Center(child: _buildSliderButton()),
              orElse: () => _buildLocationAccessRequired(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLocationAccessRequired() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.locationAccessIsRequired.tr(context: context)),
        TextButton(
          onPressed: () async {
            await openAppSettings();
            if (await Permission.location.isGranted && mounted) {
              await context.read<LocationServiceCubit>().getLocation();
            }
          },
          child: Text(LocaleKeys.openSettings.tr(context: context)),
        ),
      ],
    );
  }

  void _showLocationErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.locationPermission.tr(context: context)),
        content: Text(error),
        actions: [
          TextButton(
            child: Text(LocaleKeys.openSettings.tr(context: context)),
            onPressed: () async {
              await openAppSettings();
              if (await Permission.location.isGranted && mounted) {
                await context.read<LocationServiceCubit>().getLocation();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchDebouncer.dispose();
    _readyGetOrder.dispose();
    WakelockPlus.disable();
    super.dispose();
  }
}

// Add this class for search debouncing
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}