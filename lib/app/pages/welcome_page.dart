import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/_components.dart';
import '../../widgets/_widgets.dart';
import '../screens/_screens.dart';
import '../utils/consts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userName = "Zachary B Smith";
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).cardColor,
                spreadRadius: spreadRadius8,
                blurRadius: blurRadius24,
              ),
            ],
          ),
          child: const Text('The Bar'),
        ),
        centerTitle: false,
        leadingWidth: 54,
        leading: const Align(
            alignment: Alignment.centerRight, child: HomeSpeedDialButton()),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Hero(
                  tag: 'hero-profile-picture',
                  child: Avatar.small(
                    url: null,
                    onTap: () {
                      Navigator.of(context).push(ProfileScreen.route);
                    },
                    userName: userName,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Notifications Page',
        ),
      ),
    );
  }
}
