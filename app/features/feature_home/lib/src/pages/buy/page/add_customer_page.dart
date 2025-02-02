import 'dart:core';
import 'dart:developer';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../widget/custom_phone_input.dart';

@RoutePage()
class AddCustomerPage extends StatefulWidget implements AutoRouteWrapper {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCustomerCubit>(
          create: (_) => AppBlocHelper.getPostCustomerCubit(),
        ),
        BlocProvider<RegionCubit>(
          create: (_) => AppBlocHelper.getRegionCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _AddingPageState extends State<AddCustomerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late CustomerPostModel _customer;

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController father = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  Map<String,int> regions = {};
  int regionID = 0;
  String gender = 'male';
  ValueNotifier<DateTime> birthDate = ValueNotifier(DateTime(2006));

  ValueNotifier<bool> loading = ValueNotifier(false);

  List<String> items = ['male', 'female'];

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.nameRequired.tr(context: context);
    }
    if (value.length < 2) {
      return LocaleKeys.nameLength.tr(context: context);
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return LocaleKeys.nameLettersOnly.tr(context: context);
    }
    return null;
  }

  String? _validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.surnameRequired.tr(context: context);
    }
    if (value.length < 2) {
      return LocaleKeys.surnameLength.tr(context: context);
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return LocaleKeys.surnameLettersOnly.tr(context: context);
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.addressRequired.tr(context: context);
    }
    if (value.length < 5) {
      return LocaleKeys.addressLength.tr(context: context);
    }
    return null;
  }

  bool _validateAge(DateTime selectedDate) {
    final now = DateTime.now();
    final age = now.year - selectedDate.year;
    final monthDiff = now.month - selectedDate.month;
    final dayDiff = now.day - selectedDate.day;

    if (age < 18 || (age == 18 && (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)))) {
      return false;
    }
    return true;
  }

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      if (!_validateAge(birthDate.value)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(LocaleKeys.ageRestriction.tr(context: context))),
        );
        return;
      }

      // await regions?.map((item) { if(item.keys == regionID) { regId = item.values; } } );

      _customer = CustomerPostModel(
          fullName: '${name.text} ${surname.text} ${father.text}',
          phone: phone.text,
          // birthDay: '${birthDate.value.day}/${birthDate.value.month}/${birthDate.value.year}',
          // gender: gender,
          regionId: regionID,
          address: address.text,
      );

      await context.read<PostCustomerCubit>().post(
          _customer
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.customerAdd.tr(context: context)),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: CustomScrollView(
            slivers: [
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              //     child: EcoDropdownMenu(
              //       topText: LocaleKeys.gender.tr(context: context),
              //       initialSelection: items[0].tr(context: context),
              //       items: items.map((value){
              //         return value.tr(context: context);
              //       }).toList(),
              //       onChanged: (value) {
              //         if(value == null) return;
              //         gender = value;
              //       },
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child: BlocBuilder<RegionCubit,RegionState>(
                    builder: (context,state){
                      return state.maybeMap(
                          success: (data) {

                            data.regions.forEach((it){
                              regions.addAll({it.name : it.id});
                            });

                            log('REGIONS: $regions');
                            log(data.regions.length.toString());
                            return EcoDropdownMenu(
                              topText: LocaleKeys.region.tr(context: context),
                              initialSelection: 'Select',
                              placeholderText: LocaleKeys.selectRegion.tr(context: context),
                              items: data.regions.map((item)=> item.name).toList(),
                              onChanged: (String? value) {
                                regionID = regions[value] ?? 0;
                                log('REGION ID: $regionID');
                              },
                            );
                          },
                          error: (er){
                            return Text(er.error);
                          },
                          orElse: (){
                            return Center(
                              child: SizedBox(
                                width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator.adaptive()),
                            );
                          }
                      );
                    }
                ),
              ).toBoxAdapter(),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: EcoTextField(
                    controller: name,
                    topRightText: LocaleKeys.name.tr(context: context),
                    hintText: LocaleKeys.enterName.tr(context: context),
                    width: double.maxFinite,
                    radius: 10,
                    validator: _validateName,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: EcoTextField(
                    controller: surname,
                    topRightText: LocaleKeys.surname.tr(context: context),
                    hintText: LocaleKeys.enterSurname.tr(context: context),
                    width: double.maxFinite,
                    radius: 10,
                    validator: _validateSurname,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: EcoTextField(
                    controller: father,
                    topRightText: '${LocaleKeys.fatherName.tr(context: context)} (${LocaleKeys.optional.tr(context: context)})',
                    hintText: LocaleKeys.enterFatherName.tr(context: context),
                    width: double.maxFinite,
                    radius: 10,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: UzbekPhoneInput(
                    controller: phone,
                    label: LocaleKeys.phoneNumber.tr(context: context),
                    onChanged: (value) {
                      print('Phone number: $value');
                    },
                    // errorText: _validatePhoneNumber(value), // Your validation logic
                  )
                ),
              ),

              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              //     child: GestureDetector(
              //       onTap: () async {
              //         final value = await showDatePicker(
              //           context: context,
              //           initialDate: DateTime(2006),
              //           firstDate: DateTime(1900),
              //           lastDate: DateTime(2006),
              //         );
              //
              //         if(value == null) return;
              //         birthDate.value = value;
              //       },
              //       child: Container(
              //         width: double.maxFinite,
              //         padding: const EdgeInsets.all(12),
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.grey),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: ValueListenableBuilder(
              //             valueListenable: birthDate,
              //             builder: (context, param, param2) {
              //               return Text(
              //                 '${param.day}/${param.month}/${param.year}',
              //                 style: TextStyle(color: Colors.grey),
              //               );
              //             }
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: EcoTextField(
                    controller: address,
                    topRightText: LocaleKeys.homeAddress.tr(context: context),
                    hintText: LocaleKeys.enterHomeAddress.tr(context: context),
                    width: double.maxFinite,
                    radius: 10,
                    validator: _validateAddress,
                  ),
                ),
              ),

              BlocConsumer<PostCustomerCubit, PostCustomerState>(
                listener: (context, state) {
                  state.mapOrNull(
                      loading: (value) {
                        loading.value = true;
                      },
                      success: (value) {
                        loading.value = false;
                        AutoRouter.of(context).pop(value.customer);
                      },
                      error: (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.error))
                        );
                      }
                  );
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: EcoElevatedButton.loading(
                        loading: state == PostCustomerState.loading(),
                        onPressed: _submitForm,
                        child: Text(LocaleKeys.addCustomer.tr(context: context))
                    ),
                  );
                },
              ).toBoxAdapter()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    surname.dispose();
    father.dispose();
    phone.dispose();
    address.dispose();
    super.dispose();
  }
}