import 'package:flutter/material.dart';

class AccentVerticalBorder extends StatelessWidget{
  final double height;

  const AccentVerticalBorder({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: const BorderRadius.all(Radius.circular(1.0)),
      ),
    );
  }

}