import 'package:flutter/material.dart';


import '_profile.dart';

class UserSettingsTile extends StatelessWidget {
  const UserSettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    this.onTapFunction,
    this.child,
    this.trailingButton,
  }) : super(key: key);

 final  Function? onTapFunction;
 final Widget icon;
 final Widget title;
 final Widget? trailingButton;
 final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          horizontalTitleGap: 6,
          visualDensity: VisualDensity.compact,
          leading: TileIcon(
            asset: icon,
          ),
          trailing: trailingButton,
          title: title,
          onTap: () {
            if (child == null) {
              onTapFunction?.call();
            }
          },
        ),
        if (child != null)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: child!,
          ),
      ],
    );
  }
}
