import 'package:flutter/material.dart';

InputDecoration getSpinnerInputDecoration(
    String hintText, BuildContext context, bool readOnly) {
  return InputDecoration(
    suffixIcon: readOnly ? const Icon(Icons.keyboard_arrow_down) : null,
    iconColor: Colors.white,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.16)),
    ),
    hintText: hintText,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
    ),
    hintStyle:
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.16)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.16)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.16)),
    ),
    // labelText: 'Enter project name',
  );
}
