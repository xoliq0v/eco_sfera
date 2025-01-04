import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddCommentPage extends StatefulWidget {
  const AddCommentPage({super.key});

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add comment'.tr(context: context)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: EcoTextField(
              keyboardType: TextInputType.text,
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
              child: Text('Save'),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
