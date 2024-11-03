
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.polygon.tr(context: context)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          20.verticalSpace,

          EcoTextField(
            topRightText: LocaleKeys.responsibleEmployee.tr(context: context),
            width: double.maxFinite,
          ),

          20.verticalSpace,

          EcoDropdownMenu(
            topText: LocaleKeys.landfillOperator.tr(context: context),
            onChanged: (value){},
            items: const [
              DropdownMenuEntry(value: 'value', label: 'label'),
            ], initialSelection: '',
          ),

          20.verticalSpace,

          EcoTextField(
            topRightText: LocaleKeys.volumeOfWaste.tr(context: context),
            width: double.maxFinite,
          ),

          70.verticalSpace,

          EcoButton(
              onPressed: (){
                // context.router.navigate(const SignatureRoute());
              },
            height: 60,
            width: MediaQuery.sizeOf(context).width * 0.9,
            borderRadius: 40,
              child: Text(LocaleKeys.acceptance.tr(context: context)),
          )

        ],
      ),
    );
  }
}
