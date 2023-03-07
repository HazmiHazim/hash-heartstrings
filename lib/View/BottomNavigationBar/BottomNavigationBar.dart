import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hash_heartstring/View/DateActivityInterface/DateActivityInterface.dart';
import 'package:hash_heartstring/View/DateQuizInterface/DateQuizInterface.dart';
import 'package:hash_heartstring/View/TruthOrDareInterface/TruthOrDareInterface.dart';
import 'package:hash_heartstring/main.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {

  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DateActivityInterface()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DateQuizInterface()),
        );
        break;
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TruthOrDareInterface()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFF69B4),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: GNav(
            onTabChange: _onTabChange,
            selectedIndex: _selectedIndex,
            backgroundColor: Color(0xFFFF69B4),
            activeColor: Color(0xFF87CEEB),
            color: Color(0xFFE6E6FA),
            tabBackgroundColor: Color(0xFFE6E6FA),
            //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.home,
                text: 'Activity',
              ),
              GButton(
                icon: Icons.home,
                text: 'Quiz',
              ),
              GButton(
                icon: Icons.home,
                text: 'Test',
              ),
            ]
        ),
      ),
    );
  }
}

