import 'package:cspit_sgp/screens/faculty/FacultyAddResult.dart';
import 'package:cspit_sgp/screens/faculty/FacultyAssignment.dart';
import 'package:cspit_sgp/screens/faculty/faculty_leaveapp.dart';
import 'package:cspit_sgp/screens/hod_screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/login_screen.dart';
import 'package:cspit_sgp/services/auth.dart';
// import 'package:school_management_system/screens/Faculty/FacultyEvent.dart';
// import 'package:school_management_system/screens/Faculty/FacultyAchievements.dart';
// import 'package:school_management_system/screens/Faculty/FacultyQA.dart';

class drawer extends StatelessWidget {
  var faculty;

  drawer({this.faculty});

  @override
  Widget build(BuildContext context) {
    AuthService auth =AuthService();

    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Color(0xffd6ecf2),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Column(
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    faculty.name,
                    style: TextStyle(
                        fontFamily: 'source sans pro',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("CSPIT IT",
                      style: TextStyle(
                          fontFamily: 'source sans pro',
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.50))),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.article,
                      size: 25,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Leave Application',
                      style: TextStyle(fontFamily: 'source sans pro', fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(FacultyLeaveApplication.id);
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.assignment_ind_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Assignment',
                      style: TextStyle(fontFamily: 'source sans pro', fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(FacultyAssignment.id);
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/teacherfinal.png'),
                    title: Text(
                      'Principal Desk',
                      style: TextStyle(fontFamily: 'source sans pro', fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(PrincipalDeskScreen.id);
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/trophy.png'),
                    title: Text(
                      'Events',
                      style: TextStyle(fontFamily: 'source sans pro', fontSize: 18),
                    ),
                    onTap: () {
                      // Navigator.of(context).pushNamed(FacultyEvent.id);
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/resultdrawer.png'),
                    title: Text(
                      'Add Result',
                      style: TextStyle(fontFamily: 'source sans pro', fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(FacultyAddResult.id,
                          arguments: {"faculty": faculty});
                    },
                  ),
                ],
              ),
            ),
          ),
          // Spacer(),
          Container(
            margin: EdgeInsets.only(top:20),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(
                        fontFamily: 'source sans pro',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ],
              ),
              tileColor: Color(0xff345fb4),
              onTap: () async{
                await auth.signout();
                Navigator.popAndPushNamed(context, LoginScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
