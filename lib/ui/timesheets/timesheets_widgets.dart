import 'package:flutter/material.dart';

import '../widgets/menu_button.dart';

class TimesheetsWidget extends StatelessWidget {
  const TimesheetsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Timesheets",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: <Widget>[MenuButton.plus(onPressed: () {})],
      ),
      body: const Center(
        child: Text("Timesheets"),
      ),
    );
  }
}
