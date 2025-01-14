import 'dart:async';
import 'dart:ffi';

import 'package:action_slider/action_slider.dart';
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
  final ValueNotifier<bool> _hasIssue = ValueNotifier(true);
  final TextEditingController _searchController = TextEditingController();
  late final ActionSliderController sliderController;
  late LocationEntity _location;
  // Add a Set to keep track of viewed orders
  final Set<String> _viewedOrders = {};

  bool isControllerInitialized() {
    try {
      // Try to access the controller
      final _ = sliderController;
      return true;
    } on Exception {
      return false;
    }
  }


  // Add debouncer for search
  final _searchDebouncer = Debouncer(milliseconds: 300);

  void _showLocationErrorDialog(BuildContext context, String error) {
    // Capture the cubit before showing dialog
    final locationCubit = context.read<LocationServiceCubit>();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => AlertDialog(  // Note: using dialogContext here
        title: Text(LocaleKeys.locationPermission.tr(context: context)),
        content: Text(error.tr(context: context)),
        actions: [
          TextButton(
            child: Text(LocaleKeys.cancel.tr(context: context)),
            onPressed: () {
              _hasIssue.value = true;
              _readyGetOrder.value = false;
              Navigator.pop(dialogContext);
            },
          ),
          TextButton(
            child: Text(LocaleKeys.tryAgain.tr(context: context)),
            onPressed: () async {
              Navigator.pop(dialogContext);
              await locationCubit.retryLocation();  // Use captured cubit
            },
          ),
        ],
      ),
    );
  }

  void _showLocationPermissionDialog(BuildContext context, String error) {
    // Capture the cubit before showing dialog
    final locationCubit = context.read<LocationServiceCubit>();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(  // Note: using dialogContext here
        title: Text(LocaleKeys.locationPermission.tr(context: context)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(error.tr(context: context)),
            const SizedBox(height: 12),
            Text(LocaleKeys.locationAccessIsRequired.tr(context: context)),
          ],
        ),
        actions: [
          TextButton(
            child: Text(LocaleKeys.cancel.tr(context: context)),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          TextButton(
            child: Text(LocaleKeys.openSettings.tr(context: context)),
            onPressed: () async {
              Navigator.pop(dialogContext);
              await openAppSettings();
              if (mounted && await Permission.location.isGranted) {
                await locationCubit.getLocation();  // Use captured cubit
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    sliderController = ActionSliderController();
    WakelockPlus.enable();
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

  void changeTabUsingContext(BuildContext context, int index) {
    AutoTabsRouter.of(context).setActiveIndex(index);
  }

  void _showOrderSheet(OrderModel order,bool isNew) {
    order.copyWith(status: false);
    OrderSheet.show(
      onAcceptPress: () async{
        await context.read<OrderCubit>().accept(order.id);
        await context.read<OrderCubit>().retry(_location);
        changeTabUsingContext(context, 2);
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
      child: ValueListenableBuilder(
          valueListenable: _hasIssue,
          builder: (context, hasIssue, _) {
            if (hasIssue && isControllerInitialized()) {
              sliderController.failure();
              sliderController.reset();
            }
            return ActionSlider.standard(
              width: double.maxFinite,
              rolling: true,
              height: 75,
              backgroundColor: context.colorScheme.surface,
              toggleColor: context.colorScheme.secondary,
              sliderBehavior: SliderBehavior.stretch,
              boxShadow: [],
              controller: sliderController, // Use the controller here
              action: (controller) async {
                controller.loading();
                if (mounted) {
                  final res = await context.read<LocationServiceCubit>().getLocation();
                  if (!res) {
                    controller.failure();
                    controller.reset();
                  }
                }
                if (_hasIssue.value) {
                  controller.failure();
                  controller.reset();
                } else {
                  controller.success();
                }
              },
              child: Text(LocaleKeys.getOrder.tr(context: context)),
            );
          }
      ),
    );
  }

  @override
  void dispose() {
    sliderController.dispose();
    _searchController.dispose();
    _searchDebouncer.dispose();
    _readyGetOrder.dispose();
    WakelockPlus.disable();
    super.dispose();
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
                  _readyGetOrder.value = false;
                  sliderController.reset();
                  // context.read<LocationServiceCubit>().init();
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
        listener: (context, state) => _handleLocationState(state),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text(e)),
                    ElevatedButton(onPressed: (){
                       context.read<LocationServiceCubit>().retryLocation();
                    }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
                  ],
                ),
              ),
              success: (orders, currentLocation, isInitialFetch, isRealtime, newOrders) {
                // _readyGetOrder.value = true;
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

  void _handleLocationState(LocationServiceState state) {
    state.whenOrNull(
      success: (location) async {
        _location = location;
        await context.read<OrderCubit>().getOrder(location);
        _hasIssue.value = false;
        _readyGetOrder.value = true;
      },
      error: (error) {
        _hasIssue.value = true;
        _readyGetOrder.value = false;
        if (error.toString().contains('permanently denied')) {
          _showLocationPermissionDialog(context, error.toString());
        } else {
          _showLocationErrorDialog(context, error.toString());
        }
      },
      init: () => _readyGetOrder.value = false,
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