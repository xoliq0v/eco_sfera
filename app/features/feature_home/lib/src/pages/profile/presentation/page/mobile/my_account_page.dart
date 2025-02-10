import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../widget/payment_item.dart';

@RoutePage()
class MyAccountPage extends StatefulWidget implements AutoRouteWrapper {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionCubit>(
          create: (context) => AppBlocHelper.getTransactionCubit(),
        ),
        BlocProvider<BalanceCubit>(
          create: (context) => AppBlocHelper.getBalanceCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _MyAccountPageState extends State<MyAccountPage> {
  final ValueNotifier<DriverData?> _driverData = ValueNotifier(null);
  
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void dispose() {
    _driverData.dispose();
    super.dispose();
  }

  Future<void> _initializeData() async {
    await Future.wait([
      context.read<BalanceCubit>().init(),
      context.read<TransactionCubit>().fetchTransaction(),
    ]);
  }

  Future<void> _refreshData() async {
    await _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: CustomScrollView(
              // physics: const AlwaysScrollingScrollPhysics(),
              slivers: [
                _buildTopSpacing(),
                _buildBalanceCard(context),
                _buildMiddleSpacing(),
                _buildHistoryTitle(context),
                _buildBottomSpacing(),
                _buildTransactionsList(context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: context.colorScheme.surface,
      title: Text(LocaleKeys.myAccount.tr(context: context)),
      scrolledUnderElevation: 4,
      elevation: 4,
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                _buildCardBackground(constraints),
                _buildCardContent(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCardBackground(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppIcons.cardImage,
        fit: BoxFit.cover,
        width: constraints.maxWidth,
        height: 170,
      ),
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<DriverData?>(
          valueListenable: _driverData,
          builder: (context, driver, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBalanceLabel(context),
                _buildBalanceAmount(context),
                const Spacer(),
                _buildDriverName(context, driver),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBalanceLabel(BuildContext context) {
    return Text(
      LocaleKeys.totalBalance.tr(context: context),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _buildBalanceAmount(BuildContext context) {
    return BlocBuilder<BalanceCubit, BalanceState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => _buildBalanceShimmer(context),
          success: (state) => Text(
            LocaleKeys.buySum.tr(
              context: context,
              args: [state.balance.formattedWithSpaces],
            ),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBalanceShimmer(BuildContext context) {
    return ShimmerView(
      child: Container(
        width: 120,
        height: 25,
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildDriverName(BuildContext context, DriverData? driver) {
    if (driver == null) {
      return ShimmerView(
        child: Container(
          width: 90,
          height: 20,
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      );
    }

    return Text(
      '${driver.name} ${driver.surname}',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _buildTransactionsList(BuildContext context, TransactionState state) {
    return state.maybeWhen(
      success: (data, user) {
        _driverData.value = user;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final date = data.transactionsByDate.keys.elementAt(index);
              final transactions = data.transactionsByDate[date]!.transactions;
              return _buildTransactionSection(context, date, transactions);
            },
            childCount: data.transactionsByDate.length,
          ),
        );
      },
      error: (error) => _buildErrorState(context, error),
      orElse: () => _buildLoadingState(),
    );
  }

  Widget _buildTransactionSection(
    BuildContext context,
    String date,
    List<Transaction> transactions,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Text(
            date.toLowerCase().tr(context: context),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        ...transactions.map((Transaction transaction) => PaymentItem(
          paymentHistory: transaction,
        )),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error),
            const SizedBox(height: 16),
            EcoOutlineButton(
              onPressed: () => context.read<TransactionCubit>().fetchTransaction(),
              child: Text(LocaleKeys.update.tr(context: context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5,
        (context, index) => _buildLoadingItem(context),
      ),
    );
  }

  Widget _buildLoadingItem(BuildContext context) {
    return ShimmerView(
      child: ListTile(
        trailing: Container(
          width: 70,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        title: Container(
          width: 70,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        subtitle: Container(
          width: 70,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSpacing() => const SliverPadding(padding: EdgeInsets.only(top: 30));
  Widget _buildMiddleSpacing() => const SliverPadding(padding: EdgeInsets.only(top: 30));
  Widget _buildBottomSpacing() => const SliverPadding(padding: EdgeInsets.only(top: 20));

  Widget _buildHistoryTitle(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20),
      sliver: SliverToBoxAdapter(
        child: Text(
          LocaleKeys.theHistoryOfWormOutput.tr(context: context),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}