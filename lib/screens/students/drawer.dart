import 'package:cspit_sgp/screens/login_screen.dart';
import 'package:cspit_sgp/screens/students/CourseScreen.dart';
import 'package:cspit_sgp/screens/students/EditProfileScreen.dart';
import 'package:cspit_sgp/screens/students/LeaveApplicationScreen.dart';
import 'package:cspit_sgp/screens/students/TeacherListScreen.dart';
import 'package:cspit_sgp/screens/students/placement_screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/services/auth.dart';

class StudentDrawer extends StatelessWidget {
  AuthService auth =AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 35,
                    spreadRadius: 1),
              ],
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
              child: Column(
                children: [
                  CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/profile.png')),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dhyey Desai",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "CSPIT IT | ID NO: 18IT030",
                      style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.50))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.article,
                    size: 25,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Leave Application',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, LeaveApplicationScreen.id);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Icon(
                    Icons.ondemand_video,
                    size: 25,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Courses',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, CourseScreen.id);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Image.asset('assets/images/teacherlist.png'),
                  title: Text(
                    'Teacher List',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, TeacherListScreen.id);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Image.asset('assets/images/placement.png'),
                  title: Text(
                    'Placement',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(PlacementScreen.id);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Image.asset('assets/images/edit.png'),
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, EditProfileScreen.id);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
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
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              tileColor: Color(0xff3f4094),
              onTap: () async {
                await auth.signout();
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.clear();
                Navigator.popAndPushNamed(context, LoginScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
