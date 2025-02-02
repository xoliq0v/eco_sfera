part of 'settings_page.dart';

class _PartnerEdit extends StatefulWidget {
  const _PartnerEdit();

  @override
  State<_PartnerEdit> createState() => __PartnerEditState();
}

class __PartnerEditState extends State<_PartnerEdit> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyPhoneNumberController = TextEditingController();
  final TextEditingController aboutCompanyController = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  

  @override
  void initState() {
    context.read<EditPartnerInfoCubit>().getPartnerProfile().then((value) {
      if(value != null){
        companyNameController.text = value.nickname;
        companyPhoneNumberController.text = value.phone??'';
        aboutCompanyController.text = value.about??'';
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.verticalSpace,
        SizedBox(
          width: double.maxFinite,
          height: 5,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: SizedBox.shrink(),
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Align(alignment: Alignment.centerLeft,child: Text(LocaleKeys.companyData.tr(context: context),style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,fontSize: 16),)),
        ),
        EcoTextField(
          controller: companyNameController,
          topRightText: LocaleKeys.companyName.tr(context: context),
        ),
        EcoTextField(
          controller: companyPhoneNumberController,
          topRightText: LocaleKeys.companyPhoneNumber.tr(context: context),
        ),
        EcoTextField(
          controller: aboutCompanyController,
          topRightText: LocaleKeys.aboutCompany.tr(context: context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (context,value,child) {
              return EcoElevatedButton.loading(
                loading: value,
                child: Text(LocaleKeys.save.tr(context: context)),onPressed: ()async{
                  isLoading.value = true;
                  await context.read<EditPartnerInfoCubit>().editPartnerInfo(PartnerEdit(
                    nickname: companyNameController.text,
                    phone: companyPhoneNumberController.text,
                    comment: aboutCompanyController.text,
                  )).then((value) {
                    isLoading.value = false;
                    context.router.popForced();
                  });
                },);
            }
          ),
        )
      ],
    );
  }
}