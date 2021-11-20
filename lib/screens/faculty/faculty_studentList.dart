import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentProfile.dart';

class FacultyStudentList extends StatefulWidget {
  static final id = "/StudentList";

  bool type;

  FacultyStudentList({this.type = true});

  @override
  _FacultyStudentListState createState() => _FacultyStudentListState();
}

class _FacultyStudentListState extends State<FacultyStudentList> {
  bool pressAttention = true;
  bool pressAttention1 = true;
  bool pressAttention2 = true;
  bool pressAttention3 = true;

  @override
  Widget build(BuildContext context) {

    final Map<String, bool> argu = ModalRoute.of(context)!.settings.arguments as Map<String, bool>;
    widget.type = argu['type']??true;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff3f4094),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    "Students Of Class 7IT1",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "source pro sans",
                        color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    StudentTile(
                      studentName: 'Name of student 1',
                      isPresent: pressAttention,
                      type: widget.type,
                      roll: "18IT001",
                      onTileClick: (){
                        Navigator.of(context).pushNamed(FacultyStudentProfile.id);
                      },
                      onPresentChange: () {
                        setState(() {
                          pressAttention = !pressAttention;
                        });
                      },
                    ),
                    StudentTile(
                      studentName: 'Name of student 2',
                      isPresent: pressAttention1,
                      type: widget.type,
                      roll: "18IT002",
                      onTileClick: (){
                        Navigator.of(context).pushNamed(FacultyStudentProfile.id);
                      },
                      onPresentChange: () {
                        setState(() {
                          pressAttention1 = !pressAttention1;
                        });
                      },
                    ),
                    StudentTile(
                      studentName: 'Name of student 3',
                      isPresent: pressAttention2,
                      type: widget.type,
                      roll: "18IT003",
                      onTileClick: (){
                        Navigator.of(context).pushNamed(FacultyStudentProfile.id);
                      },
                      onPresentChange: () {
                        setState(() {
                          pressAttention2 = !pressAttention2;
                        });
                      },
                    ),
                    StudentTile(
                      studentName: 'Name of student 4',
                      isPresent: pressAttention3,
                      type: widget.type,
                      roll: "18IT004",
                      onTileClick: (){
                        Navigator.of(context).pushNamed(FacultyStudentProfile.id);
                      },
                      onPresentChange: () {
                        setState(() {
                          pressAttention3 = !pressAttention3;
                        });
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class StudentTile extends StatelessWidget {
  final String studentName;
  final String roll;
  final bool isPresent;
  final Function onTileClick;
  final Function onPresentChange;
  final bool type;

  StudentTile({
    required this.studentName,
    this.isPresent = true,
    required this.onPresentChange,
    required this.onTileClick,
    required this.type,
    required this.roll,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!type) onTileClick();
      },
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: ListTile(
          title: Text(
            studentName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: "Source Sans Pro"),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "ID Number : "+roll,
              style: TextStyle(
                fontFamily: "source sans pro",
                fontSize: 16,
                // color: Color(0xffe1e3e8),
              ),
            ),
          ),
          trailing: type
              ? MaterialButton(
                  padding: EdgeInsets.all(11.0),
                  shape: CircleBorder(),
                  color: isPresent ? Colors.green : Colors.red,
                  onPressed: () {
                    onPresentChange();
                  },
                  child: Text(
                    isPresent ? "P" : 'A',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
