import 'package:flutter/material.dart';

InputDecoration getSpinnerInputDecoration(
    String hintText, BuildContext context, bool readOnly) {
  return InputDecoration(
    suffixIcon: readOnly ? const Icon(Icons.keyboard_arrow_down) : null,
    iconColor: Colors.white,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),
    ),
    hintText: hintText,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
    ),
    hintStyle:
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),
    ),
    // labelText: 'Enter project name',
  );
}
