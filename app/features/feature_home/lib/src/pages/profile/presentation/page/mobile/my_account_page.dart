

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
            create: (context){
              return AppBlocHelper.getTransactionCubit();
            },
        ),
        BlocProvider<BalanceCubit>(
          create: (context){
            return AppBlocHelper.getBalanceCubit();
          },
        ),
      ],
      child: this,
    );
  }
}

class _MyAccountPageState extends State<MyAccountPage> {

  ValueNotifier<DriverData?> driverData = ValueNotifier(null);

  @override
  void initState() {
    context.read<BalanceCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: context.colorScheme.surface,
        title: Text(LocaleKeys.myAccount.tr(context: context)),
        scrolledUnderElevation: 4,
        elevation: 4,
      ),
      body: BlocBuilder<TransactionCubit,TransactionState>(
        builder: (context,state) {
          return RefreshIndicator(
            onRefresh: ()async{
               await context.read<BalanceCubit>().init();
               await context.read<TransactionCubit>().fetchTransaction();
            },
            child: CustomScrollView(
              slivers: [
                30.verticalSpace.toBoxAdapter(),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(alignment: Alignment.center,child: SvgPicture.asset(AppIcons.cardImage)),
                    SizedBox(
                      height: 170,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 38.0,top: 20),
                        child: ValueListenableBuilder(
                          valueListenable: driverData,
                          builder: (context,p1,p2) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(LocaleKeys.totalBalance.tr(context: context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                                BlocBuilder<BalanceCubit,BalanceState>(
                                  builder: (context, state) {
                                    return state.maybeMap(
                                        orElse: (){
                                          return ShimmerView(
                                            child: SizedBox(
                                              width: 120,
                                              height: 25,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: context.colorScheme.secondary
                                                ),
                                              ),
                                            ),
                                            enable: false,
                                          );
                                        },
                                      success: (data){
                                          return Text(LocaleKeys.buySum.tr(context: context,args: [data.balance.formattedWithSpaces]),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),);
                                      }
                                    );
                                  }
                                ),
                                const Spacer(),
                                driverData.value == null ? ShimmerView(
                                  child: SizedBox(
                                    width: 90,
                                    height: 20,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: context.colorScheme.secondary
                                      ),
                                    ),
                                  ),
                                  enable: false,
                                ) : Text('${driverData.value?.name} ${driverData.value?.surname}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                              ],
                            );
                          }
                        ),
                      ),
                    )
                  ],
                ).toBoxAdapter(),
                30.verticalSpace.toBoxAdapter(),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                      LocaleKeys.theHistoryOfWormOutput.tr(context: context),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ).toBoxAdapter(),
                20.verticalSpace.toBoxAdapter(),
                state.maybeWhen(
                  success: (data,user){
                    driverData.value = user;
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          final date = data.transactionsByDate.keys.elementAt(index);
                          final transactions = data.transactionsByDate[date]!.transactions;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  date.toLowerCase().tr(context: context),
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                                ),
                              ),
                              ...transactions.map((transaction) => PaymentItem(paymentHistory: transaction)).toList(),
                            ],
                          );
                        },
                        childCount: data.transactionsByDate.length,
                      ),
                    );
                  },
                  error: (er){
                    return Column(
                      children: [
                        Text(er),
                        EcoOutlineButton(
                            onPressed: (){
                              context.read<TransactionCubit>().fetchTransaction();
                            },
                            child: Text(LocaleKeys.update.tr(context: context))
                        )
                      ],
                    ).toBoxAdapter();
                  },
                    orElse: (){
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 5,
                            (context,index){
                              return ShimmerView(
                                child: ListTile(
                                  trailing: SizedBox(
                                    width: 70,
                                    height: 25,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                  title: SizedBox(
                                    width: 70,
                                    height: 15,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.grey
                                        ),
                                    ),
                                  ),
                                  subtitle: SizedBox(
                                    width: 70,
                                    height: 15,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      );
                    },
                ),

              ],
            ),
          );
        }
      ),
    );
  }
}
