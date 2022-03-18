import 'package:bar_gym_app/components/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import '../../components/_components.dart';

import '../screens/_screens.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String userName = 'Zachary B Smith';
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).cardColor,
                spreadRadius: 8,
                blurRadius: 24,
              ),
            ],
          ),
          child: const Text('Workout Library'),
        ),
        centerTitle: false,
        leadingWidth: 54,
        leading: const Align(
          alignment: Alignment.centerRight,
          child: HomeSpeedDialButton(),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => {},
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [],
                    ),
                  ),
                ),
              ),
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
      body: DemoTabBar(tabController: _tabController),
    );
  }
}
