import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

part 'success.dart';
part '../widget/submission_button.dart';

@RoutePage()
class SubmissionPage extends StatefulWidget implements AutoRouteWrapper {
  final PartnerItem parnter;
  final int partnerId;
  const SubmissionPage({super.key, required this.partnerId,required this.parnter});

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubmissionCubit>(
          create: (context) => AppBlocHelper.getSubmissionCubit(),
        ),
        BlocProvider<LocationServiceCubit>(
          create: (context) => AppBlocHelper.getLocationServiceCubit(),
        ),
        BlocProvider<ProductCubit>(
          create: (context) => AppBlocHelper.getProductCubit(),
        ),
        BlocProvider<UserDataCubit>(
          create: (context) => AppBlocHelper.getUserDataCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _SubmissionPageState extends State<SubmissionPage> {

  final List<Product> products = [];
  DriverData? driverData;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async{
    await context.read<ProductCubit>().getProducts();
    driverData = await context.read<UserDataCubit>().getDriver();
    await context.read<SubmissionCubit>().getPartnerData(widget.partnerId);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener<ProductCubit,ProductState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (data){
              products.addAll(data.products);
            }
          );
        },
        child: BlocBuilder<SubmissionCubit, SubmissionState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (partnerData,driverData) => _Success(partnerData: partnerData,driverData: driverData,products: products,partner: widget.parnter),
              orElse: () => const SizedBox.shrink(),
              loading: () => Center(child: const CircularProgressIndicator.adaptive()),
              error: (error) => _Success(products: products,partner: widget.parnter,driverData: driverData,),
            );
          },
        ),
      ),
    );
  }
}