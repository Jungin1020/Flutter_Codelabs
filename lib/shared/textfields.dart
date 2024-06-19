import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String) onFieldSubmitted;

  const RoundedTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Set the border radius here
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Set the focused border radius here
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
