import 'package:cspit_sgp/screens/faculty/faculty_mainmenu.dart';
import 'package:cspit_sgp/screens/faculty/faculty_timetable.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/faculty/faculty_profile.dart';
import 'package:cspit_sgp/screens/faculty/faculty_drawer.dart';
import 'package:cspit_sgp/models/Faculty.dart';
import 'package:cspit_sgp/screens/NotificationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cspit_sgp/services/database.dart';

class FacultyDashboardScreen extends StatefulWidget {

  static final id='/FacultyDashboard';

  @override
  _FacultyDashboardScreenState createState() => _FacultyDashboardScreenState();
}

class _FacultyDashboardScreenState extends State<FacultyDashboardScreen> {
  int selectedIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Faculty currentFaculty=Faculty();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<Faculty> getData() async{
    currentFaculty=await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid, isStudent: false).currentFaculty;
    return currentFaculty;
  }

  @override
  Widget build(BuildContext context) {
    // final Pages = [FacultyMainMenu(), FacultyTimeTable(),Profile(Teacher: teacher)];

    final List<Widget> _pages = [
      FacultyMainMenu(),
      FacultyTimeTable(teacher: currentFaculty,),
      Profile(Teacher: currentFaculty,),
    ];

    return FutureBuilder(
      future: getData(),
      builder: (ctx,snapshot){
          if(snapshot.hasData){
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Color(0xff3f4094),
                  actions: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(NotificationScreen.id);
                      },
                      child: Container(
                        child: Icon(Icons.notifications),
                        margin: EdgeInsets.only(right: 20),
                      ),
                    ),
                  ],
                ),
                drawer:drawer(faculty: currentFaculty,),
                body: _pages[selectedIndex],
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
                        icon: Icon(Icons.calendar_today_outlined),
                        label: 'TimeTable',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    unselectedItemColor: Colors.black26,
                    selectedItemColor: Color(0xff3f4094),
                    onTap: _onItemTapped,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            );
          }else{
            return LoadingScreen();
          }
      },
    );
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getData();
  }
}

