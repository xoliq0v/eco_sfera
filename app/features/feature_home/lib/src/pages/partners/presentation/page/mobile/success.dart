part of 'submission_page.dart';

class _Success extends StatefulWidget {
  final PartnerData? partnerData;
  final DriverData? driverData;
  final List<Product>? products;
  final PartnerItem partner;
  const _Success({super.key, this.partnerData, this.driverData, this.products,required this.partner});

  @override
  State<_Success> createState() => __SuccessState();
}

class __SuccessState extends State<_Success> {
  final TextEditingController _responsibleEmployeeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ValueNotifier<bool> _editAble = ValueNotifier(true);
  final Set<int> _selectedProductIds = {};
  final List<ProductRowData> _productRows = [];

  @override
  void initState() {
    super.initState();
    _responsibleEmployeeController.text = '${widget.driverData?.name} ${widget.driverData?.surname}' ?? '';
    if (widget.driverData == null) {
      _editAble.value = false;
    }
  }

  @override
  void dispose() {
    _responsibleEmployeeController.dispose();
    _descriptionController.dispose();
    for (var row in _productRows) {
      row.dispose();
    }
    super.dispose();
  }

  void _removeProductRow(int index) {
    setState(() {
      final row = _productRows[index];
      _selectedProductIds.remove(row.selectedProduct?.id);
      row.dispose();
      _productRows.removeAt(index);
    });
  }

  double _calculateTotalPrice() {
    if (_productRows.isEmpty) return 0.0;
    
    double total = 0.0;
    for (var row in _productRows) {
      if (row.selectedProduct != null && row.weightController.text.isNotEmpty) {
        final price = double.tryParse(row.selectedProduct!.price) ?? 0;
        final weight = double.tryParse(row.weightController.text) ?? 0;
        final rowTotal = price * weight;
        total += rowTotal;
      }
    }
    return total;
  }

  double _calculateTotalWeight() {
    if (_productRows.isEmpty) return 0.0;
    
    double total = 0.0;
    for (var row in _productRows) {
      if (row.weightController.text.isNotEmpty) {
        total += double.tryParse(row.weightController.text) ?? 0;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.submission.tr(context: context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (widget.partnerData != null) 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Text(widget.partnerData!.comment ?? ''),
                    ) 
                  else 
                    Text(widget.partner.comment),
                  
                  ValueListenableBuilder(
                    valueListenable: _editAble,
                    builder: (context, value, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: EcoTextField(
                          hintText: LocaleKeys.responsibleEmployee.tr(context: context),
                          controller: _responsibleEmployeeController,
                          readOnly: value,
                        ),
                      );
                    }
                  ),
                  
                  // Product Rows
                  ...List.generate(_productRows.length, (index) {
                    final row = _productRows[index];
                    final product = row.selectedProduct;
                    final weight = double.tryParse(row.weightController.text) ?? 0;
                    final price = double.tryParse(product?.price ?? '0') ?? 0;
                    final rowTotal = weight * price;
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  product?.name ?? '',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 2,
                                child: EcoTextField(
                                  hintText: LocaleKeys.weight.tr(context: context),
                                  controller: row.weightController,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  onChanged: (_) => setState(() {}),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () => _removeProductRow(index),
                              ),
                            ],
                          ),
                          // if (weight > 0) Padding(
                          //   padding: const EdgeInsets.only(top: 4.0),
                          //   child: Text(
                          //     '${weight.toStringAsFixed(2)} kg × ${price.toStringAsFixed(2)} = ${rowTotal.toStringAsFixed(2)}',
                          //     style: const TextStyle(fontSize: 12),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }),
                  
                  // Add Product Button
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (products) {
                          if (_selectedProductIds.length < products.length) {
                            return Padding(
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
                                        _selectedProductIds.add(product.id);
                                        final newRow = ProductRowData();
                                        newRow.selectedProduct = product;
                                        _productRows.add(newRow);
                                      });
                                    },
                                    itemBuilder: (context) => products
                                        .where((p) => !_selectedProductIds.contains(p.id))
                                        .map((product) => PopupMenuItem(
                                              value: product,
                                              child: Text(product.name),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: EcoTextField(
                      hintText: LocaleKeys.description.tr(context: context),
                      controller: _descriptionController,
                    ),
                  ),
                  
                  // Total Weight and Price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          '${LocaleKeys.totalPrice.tr(context: context, args: [_calculateTotalWeight().toStringAsFixed(2)])}: ${_calculateTotalPrice().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Submit Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: SubmissionButton(
              partner: widget.partner,
              partnerData: widget.partnerData,
              responsibleEmployeeController: _responsibleEmployeeController,
              products: _productRows.where((row) => row.isValid).map((row) => 
                AdTrash(
                  trashId: row.selectedProduct!.id,
                  price: int.parse(row.weightController.text),
                )
              ).toList(),
              descriptionController: _descriptionController,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductRowData {
  final TextEditingController weightController = TextEditingController();
  Product? selectedProduct;

  bool get isValid => 
    selectedProduct != null && 
    weightController.text.isNotEmpty && 
    double.tryParse(weightController.text) != null;

  void dispose() {
    weightController.dispose();
  }
}