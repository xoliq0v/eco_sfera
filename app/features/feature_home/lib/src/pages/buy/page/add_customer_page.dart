import 'dart:core';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

@RoutePage()
class AddCustomerPage extends StatefulWidget implements AutoRouteWrapper {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PostCustomerCubit>(
      create: (_) => AppBlocHelper.getPostCustomerCubit(),
      child: this,
    );
  }
}

class _AddingPageState extends State<AddCustomerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController father = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  String gender = 'Male';
  ValueNotifier<DateTime> birthDate = ValueNotifier(DateTime(2007));

  ValueNotifier<bool> loading = ValueNotifier(false);

  List<String> items = ['Male', 'Female'];

  // Validation methods
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  String? _validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Surname is required';
    }
    if (value.length < 2) {
      return 'Surname must be at least 2 characters long';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Surname can only contain letters and spaces';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    if (value.length < 5) {
      return 'Address must be at least 5 characters long';
    }
    return null;
  }

  bool _validateAge(DateTime selectedDate) {
    // Validate age (at least 18 years old)
    final now = DateTime.now();
    final age = now.year - selectedDate.year;
    final monthDiff = now.month - selectedDate.month;
    final dayDiff = now.day - selectedDate.day;

    if (age < 18 || (age == 18 && (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)))) {
      return false;
    }
    return true;
  }

  void _submitForm() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // Additional age validation
      if (!_validateAge(birthDate.value)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You must be at least 18 years old')),
        );
        return;
      }

      // If all validations pass, post the customer
      context.read<PostCustomerCubit>().post(
          CustomerPostModel(
              name: name.text,
              surname: surname.text,
              middleName: father.text,
              phone: phone.text,
              birthDay: '${birthDate.value.day}/${birthDate.value.month}/${birthDate.value.year}',
              gender: gender,
              address: address.text
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer add'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: CustomScrollView(
            slivers: [
              // Gender Dropdown
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  child: EcoDropdownMenu(
                    topText: 'Gender',
                    initialSelection: items[0],
                    items:  items,
                    onChanged: (value){
                      if(value == null) return;
                      gender = value;
                    },
                  ),
                ),
              ),

              // Name TextField with Validation
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: EcoTextField(
                    controller: name,
                    topRightText: 'Name',
                    hintText: 'Enter your name',
                    width: double.maxFinite,
                    radius: 10,
                    validator: _validateName,
                  ),
                ),
              ),

              // Surname TextField with Validation
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: EcoTextField(
                    controller: surname,
                    topRightText: 'Surname',
                    hintText: 'Enter your surname',
                    width: double.maxFinite,
                    radius: 10,
                    validator: _validateSurname,
                  ),
                ),
              ),

              // Father Name TextField (optional, so no strict validation)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: EcoTextField(
                    controller: father,
                    topRightText: 'Father Name (Optional)',
                    hintText: 'Enter your father\'s name',
                    width: double.maxFinite,
                    radius: 10,
                  ),
                ),
              ),

              // Phone Number TextField with Validation
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: EcoTextField(
                    controller: phone,
                    topRightText: 'Phone Number',
                    width: double.maxFinite,
                    radius: 10,
                  ),
                ),
              ),

              // Birthday Date Picker
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                  child: GestureDetector(
                    onTap: () async {
                      final value = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2006),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2006),
                      );

                      if(value == null) return;

                      birthDate.value = value;
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ValueListenableBuilder(
                          valueListenable: birthDate,
                          builder: (context, param, param2) {
                            return Text(
                              '${param.day}/${param.month}/${param.year}',
                              style: TextStyle(color: Colors.grey),
                            );
                          }
                      ),
                    ),
                  ),
                ),
              ),

              // Home Address TextField with Validation
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: EcoTextField(
                    controller: address,
                    topRightText: 'Home Address',
                    hintText: 'Enter your home address',
                    width: double.maxFinite,
                    radius: 10,
                    validator: _validateAddress,
                  ),
                ),
              ),

              // Submit Button with Validation
              BlocConsumer<PostCustomerCubit, PostCustomerState>(
                listener: (context, state) {
                  state.mapOrNull(
                      loading: (value) {
                        loading.value = true;
                      },
                      success: (value) {
                        loading.value = false;
                        context.back();
                      },
                    error: (error){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.error)));
                    }
                  );
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: EcoElevatedButton.loading(
                        loading: state == PostCustomerState.loading(),
                        onPressed: _submitForm,
                        child: Text('Add customer')
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
}