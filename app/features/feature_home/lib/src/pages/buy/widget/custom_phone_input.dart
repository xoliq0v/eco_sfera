import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/auth_screen.dart';

class UzbekPhoneInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final bool enabled;
  final String? label;

  const UzbekPhoneInput({
    Key? key,
    this.onChanged,
    this.controller,
    this.errorText,
    this.enabled = true,
    this.label,
  }) : super(key: key);

  @override
  State<UzbekPhoneInput> createState() => _UzbekPhoneInputState();
}

class _UzbekPhoneInputState extends State<UzbekPhoneInput> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (_controller.text.isEmpty) {
      _controller.text = '+998 ';
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                // color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: widget.errorText != null
                      ? Theme.of(context).colorScheme.error
                      : _isFocused
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline.withOpacity(0.5),
                  width: _isFocused ? 2 : 1,
                ),
                color: widget.enabled
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
            Focus(
              onFocusChange: (focused) {
                setState(() => _isFocused = focused);
              },
              child: TextFormField(
                controller: _controller,
                enabled: widget.enabled,
                style: GoogleFonts.robotoMono(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colorScheme.surface,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  border: InputBorder.none,
                  hintText: '+998 99 999 99 99',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                inputFormatters: [
                  _UzbekPhoneFormatter(),
                ],
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 16),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

class _UzbekPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Keep country code
    if (newValue.text.length < 5) {
      return TextEditingValue(
        text: '+998 ',
        selection: const TextSelection.collapsed(offset: 5),
      );
    }

    // Remove all non-digit characters except the plus sign
    String numbers = newValue.text.replaceAll(RegExp(r'[^\d+]'), '');

    // Remove any extra + signs and ensure only one at start
    numbers = '+${numbers.replaceAll('+', '')}';

    // Ensure 998 follows the +
    if (!numbers.startsWith('+998')) {
      numbers = '+998${numbers.substring(1)}';
    }

    // Limit total length
    if (numbers.length > 13) {
      numbers = numbers.substring(0, 13);
    }

    // Format the number
    String formatted = numbers.substring(0, 4); // +998
    formatted += ' ';

    if (numbers.length > 4) {
      formatted += numbers.substring(4, numbers.length >= 6 ? 6 : numbers.length);
    }
    if (numbers.length > 6) {
      formatted += ' ';
      formatted += numbers.substring(6, numbers.length >= 9 ? 9 : numbers.length);
    }
    if (numbers.length > 9) {
      formatted += ' ';
      formatted += numbers.substring(9, numbers.length >= 11 ? 11 : numbers.length);
    }
    if (numbers.length > 11) {
      formatted += ' ';
      formatted += numbers.substring(11);
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}