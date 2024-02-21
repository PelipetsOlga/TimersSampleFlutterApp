import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarCheckbox extends StatefulWidget {
  final Function onChange;
  final bool isChecked;

  const StarCheckbox({
    Key? key,
    required this.onChange,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<StarCheckbox> createState() => _StarCheckbox();
}

class _StarCheckbox extends State<StarCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange(isChecked);
        });
      },
      child: AnimatedContainer(
        height: 16,
        width: 16,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: SvgPicture.asset(
          isChecked ? "assets/star_fill.svg" : "assets/star_empty.svg",
        ),
      ),
    );
  }
}
