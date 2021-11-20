import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/RemarksModel.dart';
import 'package:cspit_sgp/models/FacultyStudent.dart';
import 'package:cspit_sgp/widgets/Remarkswidget.dart';
import 'package:cspit_sgp/screens/faculty/faculty_addRemarks.dart';

class FacultyStudentRemarks extends StatefulWidget {
  static final id = "/FacultyRemarks";

  @override
  _FacultyStudentRemarksState createState() => _FacultyStudentRemarksState();
}

class _FacultyStudentRemarksState extends State<FacultyStudentRemarks> {
  String remark='';
  List RemarksData = [
    RemarkModel(
        subName: "AC",
        Description:
            "A sleepover is a great treat for kids. Many schools use such an event as the culminating activity of the school year. ",
        Signature: true),
    RemarkModel(
        subName: "IOT",
        Description:
            "A sleepover is a great treat for kids. Many schools use such an event as the culminating activity of the school year. ",
        Signature: false),
    RemarkModel(
        subName: "SGP",
        Description:
            "A sleepover is a great treat for kids. Many schools use such an event as the culminating activity of the school year. ",
        Signature: true),
  ];

  @override
  Widget build(BuildContext context) {

    Map<String,dynamic> argu = ModalRoute.of(context)!.settings.arguments as dynamic;
    FacultyStudent student = argu['student'];
    student.Remarks = RemarksData;
    // comment above line when u  have data

    return Scaffold(
      body: SafeArea(
        child: Container(
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
                    "Remarks",
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
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 20),
                    itemCount: student.Remarks.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Remarks(sub: student.Remarks[index].subName,desc: student.Remarks[index].Description,Signature: student.Remarks[index].Signature,);
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff2351ad),
        // onPressed: (){},
        onPressed: () {
          Navigator.of(context).pushNamed(FacultyAddRemarks.id,arguments: {'students':student}).then((value) {
            setState(() {
              student=value as FacultyStudent;
            });
          }); //comment then() when database join
        },
      ),
    );
  }
}
