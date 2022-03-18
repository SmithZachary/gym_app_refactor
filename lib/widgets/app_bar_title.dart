import 'package:flutter/material.dart';

import '../app/utils/consts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.pageTitle}) : super(key: key);
  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
            spreadRadius: spreadRadius8,
            blurRadius: blurRadius24,
          ),
        ],
      ),
      child: Text(pageTitle),
    );
  }
}
