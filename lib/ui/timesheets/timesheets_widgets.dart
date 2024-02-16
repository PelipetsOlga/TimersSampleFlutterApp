import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/menu_button.dart';

Widget _plusButton = SvgPicture.asset('assets/plus_btn.svg');

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
