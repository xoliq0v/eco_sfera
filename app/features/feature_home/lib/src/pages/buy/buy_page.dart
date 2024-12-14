//
// import 'package:core/core.dart';
// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:navigation/navigation.dart';
//
// @RoutePage()
// class BuyPage extends StatefulWidget {
//   const BuyPage({super.key});
//
//   @override
//   State<BuyPage> createState() => _BuyPageState();
// }
//
// class _BuyPageState extends State<BuyPage> {
//
//   final List<String> options = ['Option 1', 'Option 2', 'Option 3'];
//
//   Future<List<String>> _fetchCustomers() async {
//     // Simulate API call with delay
//     await Future.delayed(const Duration(seconds: 2));
//     return [
//
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var colorScheme = Theme.of(context).colorScheme;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(LocaleKeys.buy.tr(context: context)),
//         leadingWidth: 125,
//         leading: Padding(
//           padding: const EdgeInsets.only(
//               top: 10,
//               left: 10
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(LocaleKeys.totalBalance.tr(context: context),style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 13),),
//               Text('0sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: EcoTextField(
//                 topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
//                 width: double.maxFinite,
//                 radius: 10,
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: GestureDetector(
//                 onTap: (){
//
//                 },
//                 child: EcoDropdownMenu(
//                     padding: const EdgeInsets.only(left: 16),
//                     topText: LocaleKeys.customer.tr(context: context),
//                     initialSelection: '',
//                     loadItems: _fetchCustomers, onChanged: (value){},
//                   onAddCustomer: () {
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddingPage()));
//                   },
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: EcoTextField(
//                       topRightText: LocaleKeys.paper.tr(context: context),
//                     ),
//                   ),
//                   Flexible(
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(right: 15),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: colorScheme.surface,
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Text('3 000 sum'),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: EcoTextField(
//                       topRightText: LocaleKeys.plastic.tr(context: context),
//                     ),
//                   ),
//                   Flexible(
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(right: 15),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: colorScheme.surface,
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Text('3 000 sum'),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: EcoTextField(
//                       topRightText: LocaleKeys.bakalashka.tr(context: context),
//                     ),
//                   ),
//                   Flexible(
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(right: 15),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: colorScheme.surface,
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Text('3 000 sum'),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: EcoTextField(
//                       topRightText: LocaleKeys.cardboard.tr(context: context),
//                     ),
//                   ),
//                   Flexible(
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(right: 15),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: colorScheme.surface,
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Text('3 000 sum'),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: 20.verticalSpace,
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16,right: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Jami  14 kg',style: Theme.of(context).textTheme.headlineSmall,),
//                         Text('50 000 sum',style: Theme.of(context).textTheme.displayMedium?.copyWith(
//                           fontSize: 18
//                         ),)
//                       ],
//                     ),
//                     EcoButton(
//                         width: 180,
//                         backgroundColor: colorScheme.secondary,
//                         height: 65,
//                         borderRadius: 40,
//                         onPressed: (){
//                           // context.router.navigate(const PaymentRoute());
//                           navigatePaymentPage();
//                         },
//                         child: Text(LocaleKeys.acceptance.tr(),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: AppScreen.bottomNavBarHeight.verticalSpace,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> navigatePaymentPage() async{
//     return NavigationUtils.getMainNavigator().navigatePaymentPage();
//   }
// }
//
// /// ---------------------
// ///
// ///
// ///
// class AddingPage extends StatefulWidget {
//   const AddingPage({super.key});
//
//   @override
//   State<AddingPage> createState() => _AddingPageState();
// }
//
// class _AddingPageState extends State<AddingPage> {
//
//   Future<List<String>> items() async =>  ['Male', 'Female'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customer add'),
//       ),
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             // Gender Dropdown
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
//                 child: EcoDropdownMenu(
//                   topText: 'Gender',
//                   initialSelection: '',
//                   loadItems:  items,
//                   onChanged: (value){},
//                 ),
//               ),
//             ),
//
//             // Name TextField
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: EcoTextField(
//                   topRightText: 'Name',
//                   hintText: 'Enter your name',
//                   width: double.maxFinite,
//                   radius: 10,
//                 ),
//               ),
//             ),
//
//             // Surname TextField
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: EcoTextField(
//                   topRightText: 'Surname',
//                   hintText: 'Enter your surname',
//                   width: double.maxFinite,
//                   radius: 10,
//                 ),
//               ),
//             ),
//
//             // Father Name TextField
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: EcoTextField(
//                   topRightText: 'Father Name',
//                   hintText: 'Enter your father\'s name',
//                   width: double.maxFinite,
//                   radius: 10,
//                 ),
//               ),
//             ),
//
//             // Phone Number TextField
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: EcoTextField(
//                   topRightText: 'Phone Number',
//                   hintText: 'Enter your phone number',
//                   width: double.maxFinite,
//                   radius: 10,
//                 ),
//               ),
//             ),
//
//             // Birthday Date Picker
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
//                 child: GestureDetector(
//                   onTap: () {
//                     // Implement date picker logic
//                     showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now(),
//                     );
//                   },
//                   child: Container(
//                     width: double.maxFinite,
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Text(
//                       'Select Birthday',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             // Home Address TextField
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: EcoTextField(
//                   topRightText: 'Home Address',
//                   hintText: 'Enter your home address',
//                   width: double.maxFinite,
//                   radius: 10,
//                   //maxLines: 3,
//                 ),
//               ),
//             ),
//
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                 child: EcoElevatedButton(onPressed: (){}, child: Text('Add customer')),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

// Simulated Server-like Customer Service
class CustomerService {
  static List<String> _serverCustomers = [
    'Azizbek Xoliqov',
  ];

  static Future<List<String>> fetchCustomers() async {
    await Future.delayed(const Duration(seconds: 1));
    print('Customers in service: $_serverCustomers'); // Debug print
    return List.from(_serverCustomers); // Return a copy to prevent direct modification
  }

  static Future<String?> addCustomer({
    required String name,
    required String surname,
    required String gender,
    required String phoneNumber,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    String fullName = '$name $surname';

    // Check if customer already exists before adding
    if (!_serverCustomers.contains(fullName)) {
      _serverCustomers.add(fullName);
    }

    print('Added customer: $fullName'); // Debug print
    print('Updated customer list: $_serverCustomers'); // Debug print

    return fullName;
  }
}

@RoutePage()
class BuyPage extends StatefulWidget {
  final String? name;
  const BuyPage({super.key, this.name});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  String? _selectedCustomer;
  List<String> _customerOptions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final customers = await CustomerService.fetchCustomers();
      print('Loaded customers count: ${customers.length}'); // Debug print
      setState(() {
        _customerOptions = customers; // Explicitly set the customer options
        _selectedCustomer = customers.isNotEmpty ? customers.first : null;
        _isLoading = false;
      });
    } catch (e) {
      print('Customer loading error: $e'); // Detailed error logging
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load customers: $e')),
      );
    }
  }

  Future<List<String>> _fetchCustomers() async {
    // Ensure customers are loaded before returning
    if (_customerOptions.isEmpty) {
      await _loadCustomers();
    }
    return _customerOptions;
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.buy.tr(context: context)),
        leading: SizedBox.shrink(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: 20.verticalSpace),

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
            // Customer Dropdown
            SliverToBoxAdapter(
              child: EcoDropdownMenu(
                padding: EdgeInsets.symmetric(horizontal: 15),
                topText: LocaleKeys.customer.tr(context: context),
                initialSelection: _selectedCustomer ?? widget.name,
                loadItems: widget.name == null ? () async {
                  print('Loading customers...'); // Add this debug print
                  await Future.delayed(Duration(seconds: 1));
                  final customers = await CustomerService.fetchCustomers();
                  print('Fetched customers: $customers'); // Add this debug print
                  return customers;
                } : null ,
                onChanged: (value) {
                  setState(() {
                    _selectedCustomer = value;
                  });
                },
                onAddCustomer: widget.name == null ? () async {
                  // Navigate to AddingPage and wait for result
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AddingPage()),
                  );

                  // If a new customer was added, update the dropdown
                  print(result);
                  if (result != null) {
                    setState(() {
                      _customerOptions.add(result);
                      _selectedCustomer = result;
                    });
                  }
                } : null,
              ),
            ),

        SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.paper.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorScheme.surface,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.plastic.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.bakalashka.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 20.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: EcoTextField(
                      topRightText: LocaleKeys.cardboard.tr(context: context),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text('3 000 sum'),
                    ),
                  )

                ],
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
                        Text('Jami  14 kg',style: Theme.of(context).textTheme.headlineSmall,),
                        Text('50 000 sum',style: Theme.of(context).textTheme.displayMedium?.copyWith(
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

            // Rest of the page content...
          ],
        ),
      ),
    );
  }

  Future<void> navigatePaymentPage() async{
    return NavigationUtils.getMainNavigator().navigatePaymentPage();
  }

}

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedGender;
  bool _isAdding = false;

  Future<List<String>> _genderOptions() async => ['Male', 'Female'];

  void _addCustomer() async {
    if (_validate()) {
      setState(() {
        _isAdding = true;
      });

      try {
        final newCustomer = await CustomerService.addCustomer(
          name: _nameController.text,
          surname: _surnameController.text,
          gender: _selectedGender ?? '',
          phoneNumber: _phoneController.text,
        );

        // Explicitly print the new customer
        print('New customer added: $newCustomer');

        // Return the new customer's full name to the previous screen
        Navigator.of(context).pop(newCustomer);
      } catch (e) {
        print('Add customer error: $e'); // Detailed error logging
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add customer: $e')),
        );
      } finally {
        setState(() {
          _isAdding = false;
        });
      }
    }
  }

  bool _validate() {
    if (_nameController.text.isEmpty ||
        _surnameController.text.isEmpty ||
        _selectedGender == null ||
        _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Gender Dropdown
            //             // Gender Dropdown
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                child: EcoDropdownMenu(
                  topText: 'Gender',
                  initialSelection: '',
                  loadItems:  ()async{
                    return await _genderOptions();
                  },
                  onChanged: (value){
                    _selectedGender = value;
                  },
                ),
              ),
            ),

            // Name TextField
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: EcoTextField(
                  controller: _nameController,
                  topRightText: 'Name',
                  hintText: 'Enter your name',
                  width: double.maxFinite,
                  radius: 10,
                ),
              ),
            ),

            // Surname TextField
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: EcoTextField(
                  controller: _surnameController,
                  topRightText: 'Surname',
                  hintText: 'Enter your surname',
                  width: double.maxFinite,
                  radius: 10,
                ),
              ),
            ),

            // Father Name TextField
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: EcoTextField(
                  topRightText: 'Father Name',
                  controller: _phoneController,
                  hintText: 'Enter your father\'s name',
                  width: double.maxFinite,
                  radius: 10,
                ),
              ),
            ),

            // Phone Number TextField
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: EcoTextField(
                  topRightText: 'Phone Number',
                  hintText: 'Enter your phone number',
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
                  onTap: () {
                    // Implement date picker logic
                    showDatePicker(
                      context: context,
                      initialDate: DateTime(2007),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2007),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Select Birthday',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),

            // Home Address TextField
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: EcoTextField(
                  topRightText: 'Home Address',
                  hintText: 'Enter your home address',
                  width: double.maxFinite,
                  radius: 10,
                  //maxLines: 3,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: EcoElevatedButton.loading(onPressed: _addCustomer, child: Text('Add customer'),loading: _isAdding,),
              ),
            )
          ],
        ),
      ),
    );
  }
}