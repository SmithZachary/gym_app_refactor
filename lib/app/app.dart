import 'package:bar_gym_app/app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: 'Bar App',
            debugShowCheckedModeBanner: false,
            theme: notifier.theme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
