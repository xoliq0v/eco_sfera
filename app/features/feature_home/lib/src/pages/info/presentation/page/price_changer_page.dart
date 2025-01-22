import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PriceChangerPage extends StatefulWidget {
  final String title;
  const PriceChangerPage({super.key,required this.title});

  @override
  State<PriceChangerPage> createState() => _PriceChangerPageState();
}

class _PriceChangerPageState extends State<PriceChangerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.tr(context: context)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: EcoTextField(
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: EcoMaterialButton(
              child: Text(LocaleKeys.save.tr(context: context)),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
