import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.index,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected ? Theme.of(context).primaryColor : null,
            ),
          ],
        ),
      ),
    );
  }
}
