import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

class PartnerOrDriver extends StatefulWidget {
  final Widget Function(BuildContext context, AuthType type) re;
  const PartnerOrDriver({super.key,required this.re});

  @override
  State<PartnerOrDriver> createState() => _PartnerOrDriverState();
}

class _PartnerOrDriverState extends State<PartnerOrDriver> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TypeBloc>(
      create: (context)=> AppBlocHelper.getTypeBloc(),
      child: BlocBuilder<TypeBloc,AuthTypeState>(
          builder: (context,state){
            if(state == Fail){
              return Center(
                child: Text(LocaleKeys.updateApp.tr(context: context)),
              );
            }else if(state == Init){
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }else if(state == PartnerType){
              return widget.re(context,AuthType.partner);
            }else {
              return widget.re(context,AuthType.partner);
            }
          }
      ),
    );
  }
}
