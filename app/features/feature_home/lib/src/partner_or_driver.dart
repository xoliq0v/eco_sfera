import 'package:flutter/cupertino.dart';
import 'package:model/model.dart';

class PartnerOrDriver extends StatefulWidget {
  final Widget Function(BuildContext context, AuthType type) re;
  const PartnerOrDriver({super.key,required this.re});



  @override
  State<PartnerOrDriver> createState() => _PartnerOrDriverState();

}

class _PartnerOrDriverState extends State<PartnerOrDriver> {

  late AuthType type;

  @override
  void initState() {

    super.initState();
  }

  Future<AuthType> get() async{

  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
