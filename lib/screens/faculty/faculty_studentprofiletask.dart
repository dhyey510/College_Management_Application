import 'package:cspit_sgp/screens/faculty/FacultyStudentRemarks.dart';
import 'package:cspit_sgp/screens/faculty/FacultyStudentResult.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/facultygriditem.dart';
// import 'package:school_management_system/screens/Faculty/FacultyStudentRemarks.dart';

class StudentProfileTask extends StatefulWidget {

  var student;
  StudentProfileTask({this.student});
  @override
  _StudentProfileTaskState createState() => _StudentProfileTaskState();
}

class _StudentProfileTaskState extends State<StudentProfileTask> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.only(top:20,bottom: 10),
        children: [
          GridItem(name: "Result",icon: "assets/images/result.png",index: 0,studentProfile: widget.student,route: StudentResult.id,),
          GridItem(name: "Remarks",icon: "assets/images/remarks.png",index: 1,studentProfile: widget.student,route: FacultyStudentRemarks.id,),
          // GridItem(name: "Home Work",icon: "assets/images/homework.png",index: 2,studentProfile: widget.student,route: FacultyStudentAssignment.id,),
          // GridItem(name: "Assignment",icon: "assets/images/attendance.png",index: 3,studentProfile: widget.student,route: FacultyStudentAssignment.id,),
        ],
      ),
    );
  }
}
