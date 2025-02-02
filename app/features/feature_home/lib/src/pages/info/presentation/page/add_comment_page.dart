import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

@RoutePage()
class AddCommentPage extends StatefulWidget implements AutoRouteWrapper{
  const AddCommentPage({super.key});

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PartnerCommentCubit>(
      create: (context) => AppBlocHelper.getPartnerCommentCubit(),
      child: this,
    );
  }
}

class _AddCommentPageState extends State<AddCommentPage> {

  final _formKey = GlobalKey<FormState>();

  final _commentController = TextEditingController();

  Product? _selectedProduct;

  final ValueNotifier<List<Product>> _products = ValueNotifier([]);

  final _isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    context.read<PartnerCommentCubit>().getAllProducts().then((products) {
      _products.value = products;
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.addComment.tr(context: context)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: EcoTextField(
              keyboardType: TextInputType.text,
              topRightText: LocaleKeys.comment.tr(context: context),
              controller: _commentController,
              validator: (value) {
                if(value!.isEmpty){
                  return LocaleKeys.commentIsRequired.tr(context: context);
                }
                return null;
              },
            ),
          ),
          ValueListenableBuilder(valueListenable: _products, builder: (context, products, child) {
            return EcoDropdownMenu(
              items: products.map((e) => e.name).toList(),
              onChanged: (value) {
                _selectedProduct = products.firstWhere((e) => e.name == value);
              },
            );
          }),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: ValueListenableBuilder(valueListenable: _isLoading, builder: (context, isLoading, child) {
              return EcoElevatedButton.loading(
                loading: isLoading,
                child: Text(LocaleKeys.save.tr(context: context)),
                onPressed: () async{
                  if(_selectedProduct != null || _commentController.text.isNotEmpty){
                    _isLoading.value = true;
                    await context.read<PartnerCommentCubit>().postComment(
                        _selectedProduct!.id,
                        _commentController.text,
                      ).then((value) {
                        if(value){
                          context.router.popForced();
                        }
                      });
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(LocaleKeys.commentIsRequired.tr(context: context))),
                      );
                    }
                    _isLoading.value = false;
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
