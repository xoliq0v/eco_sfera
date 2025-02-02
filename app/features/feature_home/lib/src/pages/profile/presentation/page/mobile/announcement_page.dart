import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';

@RoutePage()
class AnnouncementPage extends StatefulWidget implements AutoRouteWrapper {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
              create: (_) => AppBlocHelper.getProductCubit()
          ),
          BlocProvider<UserDataCubit>(
              create: (_) => AppBlocHelper.getUserDataCubit()
          ),
          BlocProvider<AdCubit>(
              create: (_) => AppBlocHelper.getAdCubit()
          ),
        ],
        child: this
    );
  }
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  final List<Product> products = [];
  final Set<int> selectedProductIds = {};
  final Map<int, TextEditingController> priceControllers = {};
  final phoneController = TextEditingController();
  final startTimeController = TextEditingController(text: '10:00');
  final endTimeController = TextEditingController(text: '18:00');
  final descriptionController = TextEditingController();
  PartnerInfoModel? partner;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    phoneController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    descriptionController.dispose();
    priceControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  Future<void> init() async {
    partner = await context.read<UserDataCubit>().getPartner();
    await context.read<ProductCubit>().getProducts();
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 0),
    );
    if (picked != null) {
      setState(() {
        final formattedHour = picked.hour.toString().padLeft(2, '0');
        final formattedMinute = picked.minute.toString().padLeft(2, '0');
        if (isStartTime) {
          startTimeController.text = '$formattedHour:$formattedMinute';
        } else {
          endTimeController.text = '$formattedHour:$formattedMinute';
        }
      });
    }
  }

  Widget _buildProductRow(Product product) {
    if (!priceControllers.containsKey(product.id)) {
      priceControllers[product.id] = TextEditingController();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(product.name, textAlign: TextAlign.center),
          ),
          7.horizontalSpace,
          Expanded(
            child: EcoTextField(
              controller: priceControllers[product.id],
              topRightText: LocaleKeys.productPrice.tr(context: context),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: () {
              setState(() {
                selectedProductIds.remove(product.id);
                priceControllers[product.id]?.clear();
              });
            },
          ),
        ],
      ),
    );
  }

  void _submitAnnouncement() {
    if (selectedProductIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(LocaleKeys.selectProducts.tr(context: context))),
      );
      return;
    }

    final workTime = '${startTimeController.text} - ${endTimeController.text}';
    
    final List<AdTrash> productsList = selectedProductIds.map((id) {
      final price = int.tryParse(priceControllers[id]?.text ?? '') ?? 0;
      return AdTrash(trashId: id, price: price);
    }).toList();

    final announcement = Announcement(
      number: phoneController.text,
      workTime: workTime,
      description: descriptionController.text,
      products: productsList,
    );

    context.read<AdCubit>().post(announcement);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.announcement.tr(context: context)),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (data) {
              products.clear();
              products.addAll(data.products);
            }
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            success: (products) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: EcoTextField(
                        controller: phoneController,
                        topRightText: LocaleKeys.phoneNumber.tr(context: context),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          // LengthLimitingTextInputFormatter(9),
                          // TextInputFormatter.withFunction((oldValue, newValue) {
                          //   final text = newValue.text;
                          //   if (text.isEmpty) return newValue;
                            
                          //   String formatted = '+998 ';
                          //   for (int i = 0; i < text.length; i++) {
                          //     if (i == 2) formatted += '(';
                          //     if (i == 5) formatted += ') ';
                          //     if (i == 8) formatted += '-';
                          //     formatted += text[i];
                          //   }
                            
                          //   return TextEditingValue(
                          //     text: formatted,
                          //     selection: TextSelection.collapsed(offset: formatted.length),
                          //   );
                          // }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(LocaleKeys.workingTime.tr(context: context),style: Theme.of(context).textTheme.headlineSmall?.copyWith(),),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: startTimeController,
                              // topRightText: LocaleKeys.startTime.tr(context: context),
                              decoration: InputDecoration(
                                hintText: LocaleKeys.startTime.tr(context: context),
                              ),
                              readOnly: true,
                              onTap: () => _selectTime(context, true),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('-'),
                          ),
                          Expanded(
                            child: TextField(
                              controller: endTimeController,
                              // topRightText: LocaleKeys.endTime.tr(context: context),
                              decoration: InputDecoration(
                                hintText: LocaleKeys.endTime.tr(context: context)
                              ),
                              readOnly: true,
                              onTap: () => _selectTime(context, false),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: EcoTextField(
                        controller: descriptionController,
                        topRightText: LocaleKeys.comment.tr(context: context),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...products
                        .where((p) => selectedProductIds.contains(p.id))
                        .map(_buildProductRow),
                    if (selectedProductIds.length < products.length)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: PopupMenuButton<Product>(
                              icon: const Icon(Icons.add),
                              onSelected: (Product product) {
                                setState(() {
                                  selectedProductIds.add(product.id);
                                });
                              },
                              itemBuilder: (context) => products
                                  .where((p) => !selectedProductIds.contains(p.id))
                                  .map((product) => PopupMenuItem(
                                        value: product,
                                        child: Text(product.name),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: BlocListener<AdCubit, AdState>(
                        listener: (context, state) {
                          state.mapOrNull(
                            loading: (v) {
                              _loading.value = true;
                            },
                            success: (v) {
                              _loading.value = false;
                              context.router.popForced();
                            },
                            error: (e) {
                              _loading.value = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(LocaleKeys.tryAgain.tr(context: context))),
                              );
                            }
                          );
                        },
                        child: ValueListenableBuilder(
                          valueListenable: _loading,
                          builder: (context, value, _) {
                            return EcoElevatedButton.loading(
                              onPressed: _submitAnnouncement,
                              child: Text(LocaleKeys.save.tr(context: context)),
                              loading: value,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          );
        },
      ),
    );
  }
}