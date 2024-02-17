import 'package:flutter/material.dart';

class ThemeWrapperWidget extends StatelessWidget {
  Widget childWidget;

  ThemeWrapperWidget(this.childWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).colorScheme.tertiaryContainer,
              Theme.of(context).colorScheme.onTertiaryContainer,
            ]),
      ),
      child: childWidget,
    );
  }
}
