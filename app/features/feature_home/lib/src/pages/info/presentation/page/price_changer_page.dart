import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

@RoutePage()
class PriceChangerPage extends StatefulWidget implements AutoRouteWrapper{
  final Product product;
  const PriceChangerPage({super.key,required this.product});

  @override
  State<PriceChangerPage> createState() => _PriceChangerPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PartnerTrashCubit>(
          create: (context) => AppBlocHelper.getPartnerTrashCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _PriceChangerPageState extends State<PriceChangerPage> {

  final TextEditingController _controller = TextEditingController();
  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller.text = widget.product.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          switch(context.locale){
            Locale(languageCode: 'uz') => widget.product.name,
            Locale(languageCode: 'ru') => widget.product.nameRu,
            Locale(languageCode: 'en') => widget.product.nameEn,
            _ => widget.product.name,
          }
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: EcoTextField(
              keyboardType: TextInputType.number,
              controller: _controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (context,value,child) {
                return EcoElevatedButton.loading(
                  loading: value,
                  child: Text(LocaleKeys.save.tr(context: context)),
                  onPressed: () async{
                    _isLoading.value = true;
                    if(_controller.text.isEmpty){
                      return;
                    }
                    await context.read<PartnerTrashCubit>().changeTrashPrice(widget.product.id, _controller.text);
                    context.router.popForced();
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
