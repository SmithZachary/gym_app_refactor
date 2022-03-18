import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/screens/_screens.dart';

import '_components.dart';
import 'widgets/_widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return SafeArea(
      child: Card(
        color: (brightness == Brightness.light) ? Colors.transparent : null,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: NavigationBarItem(
                  index: 0,
                  icon: CupertinoIcons.house_alt,
                  isSelected: (selectedIndex == 0),
                  onTap: handleItemSelected,
                ),
              ),
              Expanded(
                child: NavigationBarItem(
                  index: 1,
                  icon: CupertinoIcons.bubble_left_bubble_right,
                  isSelected: (selectedIndex == 1),
                  onTap: handleItemSelected,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GlowingActionButton(
                  color: Theme.of(context).primaryColor,
                  icon: CupertinoIcons.qrcode_viewfinder,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const Scanner();
                      }),
                    );
                  },
                ),
              ),
              Expanded(
                child: NavigationBarItem(
                  index: 2,
                  icon: CupertinoIcons.play_rectangle,
                  isSelected: (selectedIndex == 2),
                  onTap: handleItemSelected,
                ),
              ),
              Expanded(
                child: NavigationBarItem(
                  index: 3,
                  icon: CupertinoIcons.helm,
                  isSelected: (selectedIndex == 3),
                  onTap: handleItemSelected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
