import 'package:flutter/material.dart';

class ErrorCenterWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorCenterWidget(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
