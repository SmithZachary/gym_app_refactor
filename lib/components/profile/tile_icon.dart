import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  IconData? icon;
  Widget asset;
  TileIcon({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          radius: 16,
        ),
        asset,
      ],
    );
  }
}
