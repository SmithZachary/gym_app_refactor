import 'package:flutter/material.dart';

import '../_components.dart';

class DemoTabBar extends StatelessWidget {
  const DemoTabBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.red,
          tabs: const [
            Tab(
              text: 'Chest',
            ),
            Tab(
              text: 'Back',
            ),
            Tab(
              text: 'Legs',
            ),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        TabBarLibrary(tabController: _tabController),
      ],
    );
  }
}
