import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

String _plusButton = 'assets/plus_btn.svg';

class MenuButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;

  const MenuButton({required this.icon, this.onPressed, super.key});

  MenuButton.plus({this.onPressed, super.key}) : icon = _plusButton;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(icon),
      onPressed: onPressed,
    );
  }
}
