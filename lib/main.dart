import 'package:cspit_sgp/models/CommonUser.dart';
import 'package:cspit_sgp/screens/NotificationScreen.dart';
import 'package:cspit_sgp/screens/faculty/FacultyAddResult.dart';
import 'package:cspit_sgp/screens/faculty/FacultyAssignment.dart';
import 'package:cspit_sgp/screens/faculty/FacultyStudentRemarks.dart';
import 'package:cspit_sgp/screens/faculty/FacultyStudentResult.dart';
import 'package:cspit_sgp/screens/faculty/faculty_addRemarks.dart';
import 'package:cspit_sgp/screens/faculty/faculty_dashboard.dart';
import 'package:cspit_sgp/screens/faculty/faculty_leaveapp.dart';
import 'package:cspit_sgp/screens/faculty/faculty_signupScreen.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentList.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentProfile.dart';
import 'package:cspit_sgp/screens/hod_screen.dart';
import 'package:cspit_sgp/screens/login_screen.dart';
import 'package:cspit_sgp/screens/students/AddLeaveApplicationScreen.dart';
import 'package:cspit_sgp/screens/students/CourseDetailsScreen.dart';
import 'package:cspit_sgp/screens/students/CourseScreen.dart';
import 'package:cspit_sgp/screens/students/EditProfileScreen.dart';
import 'package:cspit_sgp/screens/students/LeaveApplicationScreen.dart';
import 'package:cspit_sgp/screens/students/TeacherListScreen.dart';
import 'package:cspit_sgp/screens/students/attendance_Screen.dart';
import 'package:cspit_sgp/screens/students/course_regi_screen.dart';
import 'package:cspit_sgp/screens/students/exam_select_screen.dart';
import 'package:cspit_sgp/screens/students/fees_screen.dart';
import 'package:cspit_sgp/screens/students/fees_select_screen.dart';
import 'package:cspit_sgp/screens/students/homework_detail_screen.dart';
import 'package:cspit_sgp/screens/students/placement_screen.dart';
import 'package:cspit_sgp/screens/students/remarks_screen.dart';
import 'package:cspit_sgp/screens/students/result_Screen.dart';
import 'package:cspit_sgp/screens/students/signup_screen.dart';
import 'package:cspit_sgp/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/students/dashboard_screen.dart';
import 'package:cspit_sgp/screens/students/examschedule_screen.dart';
import 'package:cspit_sgp/screens/students/result_select_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cspit_sgp/screens/faculty/FacultyAddNewAssignment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cspit_sgp/services/auth.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily:'Source Sans Pro',
          ),
          home: Wrapper(),
          routes: {
            DashBoardScreen.id:(context)=>DashBoardScreen(),
            HomeWorkDetailScreen.id:(context)=>HomeWorkDetailScreen(),
            PrincipalDeskScreen.id:(context)=>PrincipalDeskScreen(),
            AttendanceScreen.id:(context)=>AttendanceScreen(),
            RemarkScreen.id:(context)=>RemarkScreen(),
            ResultScreen.id:(context)=>ResultScreen(),
            ExamScheduleScreen.id:(context)=>ExamScheduleScreen(),
            ResultSelect.id:(context)=>ResultSelect(),
            ExamSelect.id:(context)=> ExamSelect(),
            FeesSelect.id:(context)=>FeesSelect(),
            FeesScreen.id:(context)=>FeesScreen(),
            CourseRegiScreen.id:(context)=>CourseRegiScreen(),
            LeaveApplicationScreen.id:(context)=>LeaveApplicationScreen(),
            AddLeaveApplicationScreen.id:(context)=>AddLeaveApplicationScreen(),
            CourseScreen.id:(context)=>CourseScreen(),
            CourseDetailsScreen.id:(context)=>CourseDetailsScreen(),
            TeacherListScreen.id:(context)=>TeacherListScreen(),
            EditProfileScreen.id:(context)=>EditProfileScreen(),
            PlacementScreen.id:(context)=>PlacementScreen(),
            LoginScreen.id:(context)=>LoginScreen(),
            FacultyDashboardScreen.id:(context)=>FacultyDashboardScreen(),
            FacultyStudentList.id:(context)=>FacultyStudentList(),
            FacultyStudentProfile.id:(context)=>FacultyStudentProfile(),
            NotificationScreen.id:(context)=>NotificationScreen(),
            StudentResult.id:(context)=>StudentResult(),
            FacultyStudentRemarks.id:(context)=>FacultyStudentRemarks(),
            FacultyAddRemarks.id:(context)=>FacultyAddRemarks(),
            FacultyLeaveApplication.id:(context)=>FacultyLeaveApplication(),
            SignUpScreen.id:(context)=>SignUpScreen(),
            FacultySignUpScreen.id:(context)=>FacultySignUpScreen(),
            FacultyAddResult.id:(context)=>FacultyAddResult(),
            FacultyAssignment.id:(context)=>FacultyAssignment(),
            AssignmentDetail.id:(context)=>AssignmentDetail(),
          },
    );
  }
}

