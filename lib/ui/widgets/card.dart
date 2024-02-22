import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  Widget child;

  AppCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ));
  }
}
