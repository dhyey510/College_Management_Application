import 'package:cspit_sgp/models/CommonUser.dart';
import 'package:cspit_sgp/screens/hod_screen.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/screens/students/course_regi_screen.dart';
import 'package:cspit_sgp/screens/students/exam_select_screen.dart';
import 'package:cspit_sgp/screens/students/fees_select_screen.dart';
import 'package:cspit_sgp/screens/students/result_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/GridItem.dart';
import 'package:cspit_sgp/screens/students/attendance_Screen.dart';
import 'package:cspit_sgp/screens/students/remarks_screen.dart';
import 'package:cspit_sgp/models/Student.dart';
import 'package:provider/provider.dart';
import 'package:cspit_sgp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<Student>(
      stream: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid, isStudent:true).getcurrentStudent,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          Student? user = snapshot.data;
          var names=user!.name.split(' ');

          return Container(
            decoration: BoxDecoration(
              color: Color(0xff3f4094),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.loose,
              children: [
                // profile short
                Positioned(
                  top: 0,
                  left: 1,
                  right: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi ${names[0]}",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "CSPIT IT | ID NO: ${user.rollNumber}",
                              style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.61)),
                            )
                          ],
                        ),
                        CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/profile.png')),
                      ],
                    ),
                  ),
                ),

                // for Main Icons
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                      color: Color(0xfff4f4f4),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.64,
                    child: GridView.count(
                      crossAxisCount: 3,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      children: [
                        GridItem(
                          title: "HOD",
                          icon: "assets/images/hod.png",
                          index: 0,
                          route: PrincipalDeskScreen.id,
                        ),
                        GridItem(
                          title: "Attendance",
                          icon: "assets/images/Attendance.png",
                          route: AttendanceScreen.id,
                          index: 1,
                        ),
                        GridItem(
                          title: "Remarks",
                          icon: "assets/images/remarks.png",
                          index: 2,
                          route: RemarkScreen.id,
                        ),
                        GridItem(
                          title: "Result",
                          icon: "assets/images/result.png",
                          index: 3,
                          route: ResultSelect.id,
                        ),
                        GridItem(
                          title: "Exam Schedule",
                          icon: "assets/images/timetable.png",
                          index: 4,
                          route: ExamSelect.id,
                        ),
                        GridItem(
                          title: "Fees",
                          icon: "assets/images/fees.png",
                          index: 5,
                          route: FeesSelect.id,
                        ),
                        GridItem(
                          title: "Course Registration",
                          icon: "assets/images/courseR.png",
                          index: 6,
                          route: CourseRegiScreen.id,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        }else{
         return LoadingScreen();
        }
      }
    );
  }
}
