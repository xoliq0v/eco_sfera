
import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class BuyPage extends StatefulWidget implements AutoRouteWrapper {
  final Map<String,int>? param;
  const BuyPage({super.key, this.param});

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
                      child: EcoTextField(
                        topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
                        width: double.maxFinite,
                        radius: 10,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: 20.verticalSpace,
                    ),
                    BlocBuilder<CustomerPaginationCubit,CustomerPaginationState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: (){

                            },
                            child: widget.param == null ? EcoDropdownMenu(
                              padding: const EdgeInsets.only(left: 16),
                              topText: LocaleKeys.customer.tr(context: context),
                              initialSelection: params.params.toString(),
                              isLoading: state.isLoadingShimmer,
                              items: state.customers.map((value){ return value.name; }).toList(),
                              onChanged: (value){},
                              onAddCustomer:  () {
                                NavigationUtils.getMainNavigator().navigateAddCustomerPage();
                              },
                            ) : EcoDropdownMenu(
                                padding: const EdgeInsets.only(left: 16),
                                placeholderText: widget.param!.keys.first,
                                onChanged:  null
                            ),
                          );
                        }
                    ).toBoxAdapter(),
                    SliverToBoxAdapter(
                      child: 20.verticalSpace,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          // Null check to prevent potential runtime errors
                          if (params.params == null || index >= params.params.length) {
                            return null; // Return null if index is out of bounds
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
                                    // Use a unique key for each TextField
                                    key: Key('param_textfield_$index'),
                                    // Null-safe access to key
                                    topRightText: params.params[index].key ?? '',
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
                                      // Null-safe conversion to string
                                      '${params.params[index].price ?? 0} sum',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        childCount: params.params?.length ?? 0, // Null-safe length
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
                                Text('Jami  0 kg',style: Theme.of(context).textTheme.headlineSmall,),
                                Text('0 sum',style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    fontSize: 18
                                ),)
                              ],
                            ),
                            EcoButton(
                                width: 180,
                                backgroundColor: colorScheme.secondary,
                                height: 65,
                                borderRadius: 40,
                                onPressed: (){
                                  // context.router.navigate(const PaymentRoute());
                                  navigatePaymentPage();
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

  Future<void> navigatePaymentPage() async{
    return NavigationUtils.getMainNavigator().navigatePaymentPage();
  }
}
