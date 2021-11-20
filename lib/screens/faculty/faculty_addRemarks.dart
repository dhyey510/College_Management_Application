import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/FacultyStudent.dart';
import 'package:cspit_sgp/models/RemarksModel.dart';

class FacultyAddRemarks extends StatefulWidget {
  static final id = "/AddRemark";

  @override
  _FacultyAddRemarksState createState() => _FacultyAddRemarksState();
}

class _FacultyAddRemarksState extends State<FacultyAddRemarks> {
  String _chosenValue='Advance Computing';
  String remarks='';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argu = ModalRoute.of(context)!.settings.arguments as dynamic;
    FacultyStudent student = argu['students'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff3f4094),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
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
                    "Add Remarks",
                    style: TextStyle(
                        fontSize: 24,
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
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      // for sub name
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Subject",
                            style: TextStyle(
                                color: Color(0xffa5a5a5), fontSize: 15),
                          )),
                      SizedBox(
                        height: 10,
                      ),

                      // for dropdown
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.only(left: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _chosenValue,
                            elevation: 5,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            items: <String>[
                              'Advance Computing',
                              'Data Science',
                              'SGP',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Text(
                              "Select Subject",
                              style: TextStyle(
                                color: Color(0xffa5a5a5),
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (value){
                              setState(() {
                                _chosenValue=value!;
                              });
                            }
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // for add remarks
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Remarks",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "source sans pro",
                                  color: Colors.black.withOpacity(0.54)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffe1e3e8),
                                  ),
                                ),
                                hintText: "Write Remarks",
                                hintStyle: TextStyle(color: Color(0xffa5a5a5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                              ),
                              maxLines: 5,
                              style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 18,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  remarks = value;
                                });
                              },
                              readOnly: false,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),

                      SizedBox(height: 50,),
                      // for submit button
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width*0.95,
                          child: RaisedButton(
                            onPressed: () {
                              student.Remarks.add(RemarkModel(
                                  subName: _chosenValue,
                                  Description: remarks,
                                  Signature: false));
                              Navigator.pop(context,student);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            color: Color(0xff2351ad),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "source sans pro",
                                  fontSize: 20),
                            ),
                          ),
                        ),

                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
