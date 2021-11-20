import 'package:cspit_sgp/models/CommonUser.dart';
import 'package:cspit_sgp/screens/faculty/faculty_dashboard.dart';
import 'package:cspit_sgp/screens/login_screen.dart';
import 'package:cspit_sgp/screens/students/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cspit_sgp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Center(child: CircularProgressIndicator());
        }
        User? user = FirebaseAuth.instance.currentUser;
        if (user!= null){
            // FirebaseAuth.instance.currentUser.emailVerified == true) {
          print("user is logged in");
          // print(user);
          print(user.email);
          if(user.email!.split('.')[1].compareTo('it@charusat')==0){
            print('faculty side');
            // Navigator.of(context).popAndPushNamed(FacultyDashboardScreen.id);
            return FacultyDashboardScreen();
          }else{
            print("student side");
            // Navigator.of(context).popAndPushNamed(DashBoardScreen.id);
            return DashBoardScreen();
          }
        } else {
          print("user is not logged in");
          return LoginScreen();
        }
      },
    );

  }
}
