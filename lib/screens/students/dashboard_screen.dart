import 'package:cspit_sgp/models/Student.dart';
import 'package:cspit_sgp/screens/NotificationScreen.dart';
import 'package:cspit_sgp/screens/students/GalleryScreen.dart';
import 'package:cspit_sgp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/screens/students/drawer.dart';
import 'package:cspit_sgp/screens/students/mainmenu_screen.dart';
import 'package:cspit_sgp/screens/students/homework_screen.dart';
import 'package:cspit_sgp/screens/students/timetable_screen.dart';
import 'package:cspit_sgp/models/CommonUser.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  static final String id = 'StudentDashBoardScreen';

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  var titles=["Home","Assignments","Gallery","TimeTable"];

  final List<Widget> _pages = [
    MainMenuScreen(),
    HomeWorkScreen(),
    GalleryScreen(),
    TimeTableScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xff3f4094),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff3f4094),
              title: Text(
                  _selectedIndex == 0 ? '' : titles[_selectedIndex]),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.pushNamed(context, NotificationScreen.id);
                  },
                  // margin: EdgeInsets.only(right: 20),
                ),
              ],
            ),
            drawer: SafeArea(
              child: StudentDrawer(),
            ),
            body: _pages[_selectedIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 15, spreadRadius: 1),
                  ]
              ),
              child: BottomNavigationBar(
                key: _bottomNavigationKey,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment),
                    label: 'Assignment',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_library_sharp),
                    label: 'Gallery',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_outlined),
                    label: 'TimeTable',
                  ),
                ],
                currentIndex: _selectedIndex,
                unselectedItemColor: Colors.black26,
                selectedItemColor: Color(0xff3f4094),
                onTap: _onItemTapped,
                backgroundColor: Colors.white,
              ),
            ),
          );
  }
}
