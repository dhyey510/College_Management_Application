import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/FacultyStudent.dart';
import 'package:cspit_sgp/models/StudentResult.dart';

class StudentResult extends StatefulWidget {
  static final id="/FacultyStudentResult";

  @override
  _StudentResultState createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {

  List ResultData=[
    {
      "sub":"AC",
      "grade":'AA'
    },
    {
      "sub":"DS",
      "grade":'AB'
    },
    {
      "sub":"IOT",
      "grade":'AB'
    },
    {
      "sub":"BT",
      "grade":'AB'
    },
    {
      "sub":"SGP",
      "grade":'AA'
    },
    {
      "sub":"LP",
      "grade":'AA'
    },
  ];


  @override
  Widget build(BuildContext context) {
    // Map<String,dynamic> argu = ModalRoute.of(context)!.settings.arguments as dynamic;
    // FacultyStudent student=argu['student'];
    List<TableRow> data;
    // var Result=ResultModal(className: '2',subResult: ResultData);
    //
    // // add student result comment this after backend
    // student.Result.add(Result);
    // student.Result.add(ResultModal(className: '1',subResult: ResultData));
    
    List<TableRow> getTableRow(int index){
      data=[];
      ResultData.forEach((value) {
        data.add(TableRow(
            children: [
              Text(
                value['sub'],
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
              Container(
                height: 50,
                color: Color(0xffB2CEFF),
                child: Center(child: Text(
                  value['grade'],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                )),
              ),
            ]
        ),
        );
      });
      return data;
    }
    

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
                    "Results",
                    style:
                    TextStyle(fontSize: 20, fontFamily: "source pro sans",color: Colors.white),
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
                    itemCount: 1,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffe1e3e8)),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // for subname
                            Center(
                              child: Text(
                                'Sem - 1',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Color(0xff313131),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            //SizedBox(height: 10,),

                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color:Color(0xffE1E3E8),
                                  ),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Table(
                                columnWidths:{
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(2),
                                },
                                defaultVerticalAlignment:TableCellVerticalAlignment.middle ,
                                children: getTableRow(index),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
