import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../app/utils/_utils.dart';

class TabBarLibrary extends StatefulWidget {
  const TabBarLibrary({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  State<TabBarLibrary> createState() => _TabBarLibraryState();
}

class _TabBarLibraryState extends State<TabBarLibrary> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          Container(
            child: ListView.builder(
                itemCount: chestTitles.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRowChest(position);
                }),
          ),
          Container(
            child: ListView.builder(
                itemCount: backTitles.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRowBack(position);
                }),
          ),
          Container(
            child: ListView.builder(
                itemCount: legsTitles.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRowLegs(position);
                }),
          ),
        ],
        controller: widget._tabController,
      ),
    );
  }

  Widget getRowChest(int i) {
    return GestureDetector(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Theme.of(context).cardColor,
          elevation: 10,
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(4.0),
              leading: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    border: Border.all(
                      color: Colors.white12,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    )),
                child: Image.asset(
                  chestMachineImage[i],
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
              title: Text(
                chestTitles[i],
                style: const TextStyle(letterSpacing: 3.0),
              ),
              subtitle: Text(chestTitles[i]),
            ),
          ]),
        ),
        onTap: () {
          Dialogs.bottomMaterialDialog(
              color: Theme.of(context).cardColor,
              context: context,
              msg: 'Select an Option!',
              title: chestTitles[i],
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return chestPages[i];
                      }),
                    );
                  },
                  text: 'Play Demo',
                  iconData: CupertinoIcons.play,
                  color: Theme.of(context).accentColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
                IconsButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return ExerciseList();
                    //   }),
                    // );
                  },
                  text: 'Log Workout',
                  iconData: CupertinoIcons.square_list,
                  color: Theme.of(context).accentColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]);
        });
  }

  Widget getRowBack(int i) {
    return GestureDetector(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Theme.of(context).accentColor,
          elevation: 10,
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              leading: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 12.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    border: Border.all(
                      color: Colors.white12,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Image.asset(
                  backMachineImage[i],
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
              title: Text(
                backTitles[i],
                style: const TextStyle(letterSpacing: 3.0),
              ),
              subtitle: Text(backTitles[i]),
            ),
          ]),
        ),
        onTap: () {
          Dialogs.bottomMaterialDialog(
              color: Theme.of(context).accentColor,
              context: context,
              msg: 'Select an Option!',
              title: backTitles[i],
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return backPages[i];
                      }),
                    );
                  },
                  text: 'Play Demo',
                  iconData: CupertinoIcons.play,
                  color: Theme.of(context).accentColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
                IconsButton(
                  onPressed: () {},
                  text: 'Log Workout',
                  iconData: CupertinoIcons.square_list,
                  color: Theme.of(context).accentColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]);
        });
  }

  Widget getRowLegs(int i) {
    return GestureDetector(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Theme.of(context).accentColor,
          elevation: 10,
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              leading: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 12.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    border: Border.all(
                      color: Colors.white12,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Image.asset(
                  legMachineImage[i],
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
              title: Text(
                legsTitles[i],
                style: const TextStyle(letterSpacing: 3.0),
              ),
              subtitle: Text(legsTitles[i]),
            ),
          ]),
        ),
        onTap: () {
          Dialogs.bottomMaterialDialog(
              color: Theme.of(context).accentColor,
              context: context,
              msg: 'Select an Option!',
              title: legsTitles[i],
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return legPages[i];
                      }),
                    );
                  },
                  text: 'Play Demo',
                  iconData: CupertinoIcons.play,
                  color: Theme.of(context).accentColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
                IconsButton(
                  onPressed: () {},
                  text: 'Log Workout',
                  iconData: CupertinoIcons.square_list,
                  color: Theme.of(context).accentColor,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]);
        });
  }
}
