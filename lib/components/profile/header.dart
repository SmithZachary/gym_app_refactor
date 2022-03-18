import 'package:bar_gym_app/components/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({Key? key, required this.userName, required this.userNumber})
      : super(key: key);
  String userNumber;
  String userName;
  @override
  Widget build(BuildContext context) {
    return ProfileHeaderTile(
      userNumber: userNumber,
      userName: userName,
    );
  }
}

class ProfileHeaderTile extends StatelessWidget {
  String userName;
  String userNumber;
  ProfileHeaderTile(
      {Key? key, required this.userName, required this.userNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Avatar(
                  userName: userName,
                  radius: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          userName,
                        ),
                      ),
                      Text(userNumber),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
