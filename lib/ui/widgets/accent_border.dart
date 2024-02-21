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

class HorizontalBorder extends StatelessWidget{

  const HorizontalBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(1.0)),
      ),
    );
  }
}