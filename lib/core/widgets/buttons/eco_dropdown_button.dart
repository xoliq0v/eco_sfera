import 'package:flutter/material.dart';

class EcoDropdownMenu extends StatelessWidget {
  final List<DropdownMenuEntry<String>> items;
  final String? initialSelection;
  final Function(String?) onChanged;
  final String? topText;
  final EdgeInsetsGeometry? padding;

  const EcoDropdownMenu({
    super.key,
    required this.items,
    required this.initialSelection,
    required this.onChanged,
    this.topText,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(topText!=null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Align(alignment: Alignment.centerLeft, child: Text(topText!,style: Theme.of(context).textTheme.headlineSmall,)),
            ),
          DropdownMenu<String>(
            width: MediaQuery.sizeOf(context).width * 0.9,
            onSelected: onChanged,
            initialSelection: '',
            dropdownMenuEntries: items,
            menuStyle: MenuStyle(
              backgroundColor: MaterialStateProperty.all(colorScheme.background),
              // shape: MaterialStateProperty.all()
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: colorScheme.surface,
                      width: 2
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: colorScheme.surface,
                      width: 2
                    )
                ),
                focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorScheme.secondary,
                        width: 2
                    )
                ),
                fillColor: colorScheme.surface
            ),
          )
        ],
      ),
    );
  }
}

// [
// DropdownMenuEntry(value: l10n.addACustomer,label: l10n.addACustomer),
// const DropdownMenuEntry(value: 'Option',label: 'Option'),
// const DropdownMenuEntry(value: 'Option',label: 'Option'),
// const DropdownMenuEntry(value: 'Option',label: 'Option'),
// ]