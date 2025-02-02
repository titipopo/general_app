import 'package:flutter/material.dart';

@immutable
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validate,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.maxLines,
    this.onSaved,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.borderRadius,
    this.focusNode,
  });
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validate;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function(String?)? onChanged;
  final String? errorText;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validate,
      maxLines: obscureText == true ? 1 : maxLines,
      keyboardType: textInputType,
      focusNode: focusNode,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        filled: true,
        errorText: errorText,
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
