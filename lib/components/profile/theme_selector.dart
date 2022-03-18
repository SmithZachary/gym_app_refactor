import 'package:bar_gym_app/components/profile/theme_icon.dart';
import 'package:bar_gym_app/components/profile/user_settings_tile.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../presentation/theme.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({Key? key, required this.onThemeSelected})
      : super(key: key);
  final ValueChanged<int> onThemeSelected;
  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
      return Column(
        children: [
          UserSettingsTile(
            icon: const Icon(Icons.palette),
            title: const Text('Theme'),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 68.0),
                    child: ThemeItem(
                      icon: Icon(Icons.wb_sunny),
                      iconCheck: Icon(Icons.check_circle),
                      iconCheckTransparent: Icon(
                        Icons.check_circle,
                        color: Colors.transparent,
                      ),
                      index: 0,
                      onTap: (index) => notifier.handleThemeSelected(index),
                      isSelected: (notifier.selectedIndex == 0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ThemeItem(
                      icon: Icon(Icons.star_outline),
                      iconCheck: Icon(Icons.check_circle),
                      iconCheckTransparent: Icon(
                        Icons.check_circle,
                        color: Colors.transparent,
                      ),
                      index: 1,
                      onTap: (index) => notifier.handleThemeSelected(index),
                      isSelected: (notifier.selectedIndex == 1),
                    ),
                  ),
                  ThemeItem(
                    icon: Icon(Icons.nightlight_round),
                    iconCheck: Icon(Icons.check_circle),
                    iconCheckTransparent: Icon(
                      Icons.check_circle,
                      color: Colors.transparent,
                    ),
                    index: 2,
                    onTap: (index) => notifier.handleThemeSelected(index),
                    isSelected: (notifier.selectedIndex == 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
