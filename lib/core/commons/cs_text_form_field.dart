import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CsTextFormField extends StatelessWidget {
  const CsTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.label,
    this.keyboardType,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
  });

  final String? label;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
