import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/FacultyStudent.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentatnds.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentprofilemain.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentprofiletask.dart';


class FacultyStudentProfile extends StatefulWidget {
  static final id = "/StudentProfile";

  @override
  _FacultyStudentProfileState createState() => _FacultyStudentProfileState();
}

class _FacultyStudentProfileState extends State<FacultyStudentProfile> {

  var studentObj=FacultyStudent(name: "Dhyey Desai",Result: [],Assignment: [],Remarks: [],Attendance: {},Homework: [],phone: "+916527865432",address: "kjshtyayuu jdfustuasi hjdysu",roll: "18IT030",dob: '05-10-2000');

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff3f4094),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
             color: Color(0xff3f4094),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                // intro
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        // backgroundImage: , for image
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        studentObj.name,
                        style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        " CSPIT IT |  ID NO: ${studentObj.roll}",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "source sans pro",
                            color: Colors.white.withOpacity(0.61)),
                      ),
                    ],
                  ),
                ),

                // the tab bar with two items
                SizedBox(
                  height: 50,
                  child: Container(
                    color: Colors.transparent,
                    child: TabBar(
                      indicatorColor: Colors.blue[100],
                      indicatorWeight: 5,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: "source sans pro",
                          fontWeight: FontWeight.w600),
                      unselectedLabelColor: Colors.white.withOpacity(0.61),
                      unselectedLabelStyle:
                          TextStyle(fontSize: 18, fontFamily: "source sans pro"),
                      tabs: [
                        Tab(
                          text: "Profile",
                        ),
                        Tab(
                          text: "Task",
                        ),
                        Tab(
                          text: "Attendance",
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      // for profile
                      StudentProfileMain(studentObj),

                      // for task
                      StudentProfileTask(student: studentObj,),

                      // for attendance
                      StudentProfileAttendance(student: studentObj,),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
