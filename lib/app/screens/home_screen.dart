// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:the_bar_gym/models/user_model.dart';
import '../../components/_components.dart';
import '../pages/_pages.dart';

class HomeScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
  HomeScreen({Key? key, this.userId}) : super(key: key);
  final String? userId;

  // final _auth = FirebaseAuth.instance;
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Welcome To The Bar');

  final pages = [
    const WelcomePage(),
    const StreamPage(),
    const TabBarDemo(),
    const StaffPage(),
  ];

  final pageTitles = const [
    'Welcome To The Bar',
    'The Locker Room',
    'Demo Library',
    'Trainers',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  // void initState() {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.formMap(value.data());
  //     // setState(() {
  //     //
  //     // });
  //   });
  //   // var userPic = loggedInUser.picURL;
  //   print(loggedInUser.userName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}
