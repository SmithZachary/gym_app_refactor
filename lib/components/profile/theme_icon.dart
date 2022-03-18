import 'package:flutter/material.dart';

class ThemeItem extends StatelessWidget {
  const ThemeItem({
    Key? key,
    this.isSelected = false,
    required this.index,
    required this.onTap,
    required this.icon,
    required this.iconCheck,
    required this.iconCheckTransparent,
  }) : super(key: key);

  final bool isSelected;
  final int index;
  final ValueChanged<int> onTap;
  final Icon icon;
  final Icon iconCheck;
  final Icon iconCheckTransparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Stack(
          alignment: Alignment.center,
          children: [icon, isSelected ? iconCheck : iconCheckTransparent]),
    );
  }
}
