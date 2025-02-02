part of '../mobile/submission_page.dart';

class SubmissionButton extends StatelessWidget {
  final PartnerData? partnerData;
  final TextEditingController responsibleEmployeeController; 
  final TextEditingController descriptionController;
  final List<AdTrash> products;
  final PartnerItem partner;
  SubmissionButton({super.key, required this.partnerData, required this.responsibleEmployeeController, required this.descriptionController,required this.products, required this.partner});

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationServiceCubit, LocationServiceState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (location) async {
                  final isSuccess = await context.read<SubmissionCubit>().createOrder(Submission(
                    driverName: responsibleEmployeeController.text,
                    partnerId: partnerData?.id??partner.id,
                    products: products,
                    comment: descriptionController.text,
                    longitude: location.longitude.toString(),
                    latitude: location.latitude.toString(),
                  ));
                  if(isSuccess) {
                    context.router.popForced();
                  }
                },
                error: (error) async {
                  await showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(LocaleKeys.error.tr(context: context)),
                      content: Text(error.toString().tr(context: context)),
                    ),
                  );
                },
                orElse: () {},
              );
            },
            child: ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context, isLoading, child) {
                return EcoElevatedButton.loading(
                  loading: isLoading,
                  child: Text(LocaleKeys.submit.tr(context: context)),
                  onPressed: () async {
                    if(responsibleEmployeeController.text.isEmpty || descriptionController.text.isEmpty) {
                      await showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(LocaleKeys.error.tr(context: context)),
                          content: Text(LocaleKeys.fillAllFields.tr(context: context)),
                        ),
                      );
                      return;
                    }
                    _isLoading.value = true;
                    await context.read<LocationServiceCubit>().getLocation();
                    _isLoading.value = false;
                  },
                );
              }
            ),
          );
  }
}