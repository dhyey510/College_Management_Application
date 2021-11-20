import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/models/Assignment.dart';
import 'package:cspit_sgp/screens/faculty/FacultyAddNewAssignment.dart';

class FacultyAssignment extends StatefulWidget {
  static final id='/Assignment';
  @override
  _FacultyAssignmentState createState() => _FacultyAssignmentState();
}

class _FacultyAssignmentState extends State<FacultyAssignment> {

  List <dynamic> AssignmentList=[
    Assignment(title: "Write 10 lines for Charusat", dueDate: "15-07-2021", attachment: "qu1.pdf",description: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",issueDate: "14-07-2021",subjectName:"English",id: "01" ),
  ];
  // List itemList = AssignmentData.AssignmentList;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Assignments",
      body: ListView.builder(
        itemCount: AssignmentList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(AssignmentDetail.id,arguments: {'edit':true,'assignmentobj':AssignmentList[index]}).then((value) {
                setState(() {
                  AssignmentList[index]=value;
                });
              });
            },
            child: Container(
              height: 180,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffe1e3e8)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // for studentname & type
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff6789ca),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,color: Colors.white,size: 12,),
                        SizedBox(width: 10,),
                        Container(
                          child: Text(
                            AssignmentList[index].dueDate,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "source sans pro",
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                    padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                  ),
                  // SizedBox(height: 7,),
                  Container(
                    child: Text(
                      AssignmentList[index].title,
                      style: TextStyle(
                          color: Color(0xff313131),
                          fontFamily: "source sans pro",
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    padding: EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 5),
                  ),

                  // for descr
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Text(
                          AssignmentList[index].description,
                          style: TextStyle(
                              color: Color(0xff777777),
                              fontFamily: "source sans pro",
                              fontSize: 13),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        margin: EdgeInsets.only(bottom: 10),
                        width: 300,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 5),
                    child: Row(
                      children: [
                        Image.asset('assets/images/pdficon.png',height: 30,width: 30,),
                        SizedBox(width: 10,),
                        Text(AssignmentList[index].attachment),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      fab: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          Navigator.of(context).pushNamed(AssignmentDetail.id,arguments: {'edit':false,'assignments':AssignmentList}).then((value){
            setState(() {
              if(value!=null)
                AssignmentList=value as List<dynamic>;
            });
          });
        },
      ),
    );
  }
}


