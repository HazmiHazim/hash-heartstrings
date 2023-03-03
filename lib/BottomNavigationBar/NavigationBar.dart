import 'package:flutter/material.dart';
import 'package:hash_heartstring/View/DateActivityInterface/DateActivityInterface.dart';
import 'package:hash_heartstring/View/DateQuizInterface/DateQuizInterface.dart';
import 'package:hash_heartstring/View/TruthOrDareInterface/TruthOrDareInterface.dart';
import 'package:hash_heartstring/main.dart';

class navigationBar extends StatefulWidget {
  const navigationBar({Key? key}) : super(key: key);

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {

  int currentTab = 0;
  final List<Widget> screens = [
    Main(),
    DateQuizInterface(),
    TruthOrDareInterface(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Main();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF8B1C3),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Main();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(color: currentTab == 0 ? Colors.pink : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DateActivityInterface();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_note,
                          color: currentTab == 1 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          'Date Activity',
                          style: TextStyle(color: currentTab == 1 ? Colors.pink : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DateQuizInterface();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.gamepad_outlined,
                          color: currentTab == 2 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          'Quiz Game',
                          style: TextStyle(color: currentTab == 2 ? Colors.pink : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = TruthOrDareInterface();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_outlined,
                          color: currentTab == 3 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          'Truth Or Dare',
                          style: TextStyle(color: currentTab == 3 ? Colors.pink : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
