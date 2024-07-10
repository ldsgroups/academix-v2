import 'package:flutter/material.dart';

class CsDropdownButtonFormField<T> extends StatelessWidget {
  const CsDropdownButtonFormField({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.onSaved,
    this.decoration,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String hintText;
  final String? Function(T?)? validator;
  final void Function(T?)? onSaved;
  final InputDecoration? decoration;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      // dropdownColor: Colors.red,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      hint: Text(
        hintText,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      decoration: (decoration ?? const InputDecoration()).copyWith(
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
