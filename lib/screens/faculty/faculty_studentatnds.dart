import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/FacultyStudent.dart';

class StudentProfileAttendance extends StatefulWidget {
  FacultyStudent student;

  StudentProfileAttendance({required this.student});

  @override
  _StudentProfileAttendanceState createState() => _StudentProfileAttendanceState();
}

class _StudentProfileAttendanceState extends State<StudentProfileAttendance> {

  Map<String, double> ScoreAttendance = {
    "Internet Of Things": 96,
    "Advance Computing": 87,
    "Language Processing": 85,
    "BlockChain Technology": 78,
    "Software Group Project": 89,
    "Data Science": 92
  }; //comment when database join

  @override
  Widget build(BuildContext context) {

    widget.student.Attendance.addAll(ScoreAttendance); //comment when database join

    List<TableRow> data = [];
    widget.student.Attendance.forEach((key, value) {
      data.add(TableRow(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              key,
              style: TextStyle(
                  fontFamily: "source pro snas",
                  fontSize: 14,
                  color: Color(0xff313131)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff6ac259).withOpacity(0.11),
            ),
            padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
            child: Text(
              value.ceil().toString() + " %",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "source pro snas",
                  fontSize: 14,
                  color: Color(0xff3a3a3a),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ));
    });

    return Container(
      color: Colors.white,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Table(
              border: TableBorder.all(color: Color(0xffe1e3e8)),
              columnWidths: {0: FlexColumnWidth(6)},
              children: data,
            ),
          ),
        ],
      ),
    );
  }
}
