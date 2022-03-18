import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:bar_gym_app/app/utils/initials.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.userName,
    this.url,
    required this.radius,
    this.onTap,
  }) : super(key: key);

  const Avatar.smallMedium({
    required this.userName,
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 21,
        super(key: key);

  const Avatar.small({
    required this.userName,
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 18,
        super(key: key);

  const Avatar.medium({
    required this.userName,
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 26,
        super(key: key);

  const Avatar.large({
    required this.userName,
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 34,
        super(key: key);

  final double radius;
  final String? url;
  final VoidCallback? onTap;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _avatar(context),
    );
  }

  Widget _avatar(BuildContext context) {
    int index = 0;
    final List<Color> colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange
    ];
    final _random = Random();

    if (url != null) {
      return CircleAvatar(
        radius: radius,
        // backgroundImage: CachedNetworkImageProvider(url!),
        backgroundColor: Theme.of(context).cardColor,
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundColor: colors[_random.nextInt(colors.length)],
        child: Center(
          child: Text(
            initials(name: userName),
            style: TextStyle(fontSize: radius),
          ),
        ),
      );
    }
  }
}
