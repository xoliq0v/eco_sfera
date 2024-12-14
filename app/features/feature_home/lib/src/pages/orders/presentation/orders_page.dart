import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/pages/orders/data/models/order.dart';
import 'package:feature_home/src/pages/orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';

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
      ],
      child: this,
    );
  }
}

class _OrdersPageState extends State<OrdersPage> {
  final list = <Order>[

  ];

  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Order> _filteredList = [];

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
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (BuildContext context, state) {
          return state.maybeWhen(
            loading: (){
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            error: (e){
              return Center(
                child: Text(e),
              );
            },
            success: (result){
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (result.isEmpty) {
                    return const Center(
                      child: Text('No orders found'),
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
                      return await context.read<OrderCubit>().retry();
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
                              OrderSheet.show(context);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
            orElse: () { return Center(child: Text('LocaleKeys.error.tr(context: context)'),);},
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}