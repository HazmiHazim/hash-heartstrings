/*import 'package:flutter/material.dart';
import 'package:hash_heartstring/DateGoal/date_goal.dart';
import 'package:hash_heartstring/main.dart';

class mainSideBar extends StatelessWidget {
  const mainSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF8B1C3),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('SITI NOR AISHAH'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/hazaish.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /*decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/love.jpg'
                ),
                //fit: BoxFit.cover,
              ),
            ),*/
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'HASH Heartstring')));
            },
          ),
          ListTile(
            leading: Icon(Icons.edit_note_outlined),
            title: Text('Date Activity'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const date_goal()));
            }
          ),
          Divider(),
          ListTile(
            title: Text(
              'Games',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlue,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.quiz_sharp),
            title: Text('Quiz Game'),
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGame()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category_outlined),
            title: Text('Truth | Dare Game'),
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => const TrueDareGame()));
            },
          ),
        ],
      ),
    );
  }
}*/
