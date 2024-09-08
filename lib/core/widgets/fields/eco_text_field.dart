import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_icon_button.dart';
import 'package:flutter/material.dart';

class EcoTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? padding;
  final InputDecoration? decoration;
  final double? width;
  final double? height;
  final bool autocorrect;
  final double? radius;
  final Color? backgroundColor;
  final Color iconColor;
  final bool validateOnChange;

  const EcoTextField({
    super.key,
    this.hintText = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.padding,
    this.decoration,
    this.width,
    this.height,
    this.radius = 20,
    this.autocorrect = true,
    this.backgroundColor,
    this.iconColor = Colors.black,
    this.validateOnChange = false,
  });

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}
class _EcoTextFieldState extends State<EcoTextField> {
  late bool _isObscured;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _runValidator(String? value) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
        final double maxWidth = MediaQuery.sizeOf(context).width * (isTablet ? 0.6 : 0.8);
        final double horizontalPadding = isTablet ? 20 : 16;

        final double fontSize = isTablet ? 16 : 14;
        final double iconSize = isTablet ? 24 : 20;
        final double fieldHeight = widget.height ?? (isTablet ? 60 : 48);
        final double fieldWidth = widget.width ?? maxWidth;

        return Padding(
          padding: widget.padding ?? EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: fieldWidth,
                height: fieldHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius!),
                  color: widget.backgroundColor,
                ),
                child: TextFormField(
                  autocorrect: widget.autocorrect,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  obscureText: _isObscured,
                  textInputAction: widget.textInputAction,
                  validator: widget.validator,
                  style: TextStyle(fontSize: fontSize),
                  onChanged: (value) {
                    if (widget.validateOnChange) {
                      _runValidator(value);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5), fontSize: fontSize),
                    prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, size: iconSize, color: widget.iconColor) : null,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_errorText != null)
                          Icon(Icons.error_outline, color: colorScheme.error, size: iconSize),
                        if (widget.obscureText)
                          EcoIconButton(
                            icon: _isObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            color: widget.iconColor,
                          ),
                        if (widget.suffixIcon != null && !widget.obscureText)
                          Icon(widget.suffixIcon, size: iconSize, color: widget.iconColor),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                      borderSide: BorderSide(color: _errorText != null ? colorScheme.error : colorScheme.secondary, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                      borderSide: BorderSide(color: _errorText != null ? colorScheme.error : colorScheme.secondary, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                      borderSide: BorderSide(color: _errorText != null ? colorScheme.error : Colors.transparent, width: 1.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                      borderSide: BorderSide(color: colorScheme.error, width: 1.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius ?? maxWidth * 0.025),
                      borderSide: BorderSide(color: colorScheme.error, width: 2.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: maxWidth * 0.04,
                        vertical: (widget.height ?? maxWidth * 0.12) / 4
                    ),
                    fillColor: widget.backgroundColor,
                    filled: true,
                  ),
                ),
              ),
              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 12),
                  child: Text(
                    _errorText!,
                    style: TextStyle(color: colorScheme.error, fontSize: fontSize * 0.8),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}