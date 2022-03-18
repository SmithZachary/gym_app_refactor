import 'package:flutter/material.dart';

import '../../components/presentation/theme.dart';
import '../../components/profile/_profile.dart';
import '../../components/profile/theme_selector.dart';
import '../../components/widgets/app_bar_title.dart';
import '../../components/widgets/profile/slider/slider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static Route get route => MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      );
  final ValueNotifier<int> themeIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final themes = [THeme.midnightTheme, THeme.darkTheme, THeme.lightTheme];

  final themeTitles = const ['Midnight', 'Dark', 'Light'];
  void _onThemeSelected(index) {
    title.value = themeTitles[index];
    themeIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          pageTitle: 'Profile & Settings',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ProfileHeader(
              userName: 'Zachary B Smith',
              userNumber: '+X XXX-XXX-XXXX',
            ),
            UserSettingsTile(
              icon: const Icon(Icons.qr_code),
              title: const Text('Open in browser'),
              onTapFunction: () {},
            ),
            ThemeSelector(
              onThemeSelected: _onThemeSelected,
            ),
            UserSettingsTile(
              icon: const Icon(Icons.translate),
              title: Text('Language: English'),
              onTapFunction: () {},
            ),
            const UserSettingsTile(
              icon: Icon(Icons.star_outline),
              title: Text('What do you think of The Bar Gym App?'),
              child: AppSlider(5, 'userID'),
            ),

            UserSettingsTile(
              icon: const Icon(Icons.new_releases_outlined),
              title: const Text('What\'s new / Release history'),
              onTapFunction: () {},
            ),

            ///TODO: Bring Over PackageInfo to get Version Info
            UserSettingsTile(
              icon: const Icon(Icons.numbers),
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Version: 1.0.0 - '),
                    TextSpan(text: 'Update Available')
                  ],
                ),
              ),
            ),
            UserSettingsTile(
              icon: const Icon(Icons.error_outline),
              title: const Text('Terms of service'),
              onTapFunction: () {},
            ),
            UserSettingsTile(
              icon: Image.asset(
                'images/chest/benchpress.jpg',
                width: 22,
              ),
              title: const Text('Bar Gym App - Copyright 2022'),
              onTapFunction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
