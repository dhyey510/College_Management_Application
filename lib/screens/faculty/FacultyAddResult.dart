import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Student.dart';
import 'package:cspit_sgp/models/Faculty.dart';

class FacultyAddResult extends StatefulWidget {
  static final id = '/FacultyAddResult';

  @override
  _FacultyAddResultState createState() => _FacultyAddResultState();
}

class _FacultyAddResultState extends State<FacultyAddResult> {
  String _chosenValue='01';

  List subjects = [
    'C Language',
    'Java Language',
    'Data science',
    'Advance Computing',
    'Machine Learning'
  ];
  List gainMarks = [];
  List grade = [];
  List totalMarks = [];
  String changeValue='';
  final List<TextEditingController> totalMarkControler=[];
  final List<TextEditingController> obtainMarkControler=[];
  final List<TextEditingController> gradeControl=[];


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argu = ModalRoute.of(context)!.settings.arguments as dynamic;
    Faculty teacher = argu['faculty'];
    List<TableRow> data;
    int i=0;
    final node=FocusScope.of(context);

    // uncomment below line when database connect
    // List subjects=teacher.classTeacher.subjects;

    List<TableRow> getTableRow() {
      data = [];

      data.add(TableRow(children: [
        Container(
          height: 50,
          color: Color(0xff2351ad),
          child: Center(
            child: Text(
                "Subjects",
                style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: 50,
          color: Color(0xff2351ad),
          child: Center(
              child: Text(
                "Total",
                style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
        Container(
          height: 50,
          color: Color(0xff2351ad),
          child: Center(
              child: Text(
                "Obtain",
                style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
        Container(
          height: 50,
          color: Color(0xff2351ad),
          child: Center(
              child: Text(
                "Grades",
                style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ]),
      );

      subjects.forEach((element) {
        totalMarkControler.add(TextEditingController());
        obtainMarkControler.add(TextEditingController());
        gradeControl.add(TextEditingController());
        data.add(
          TableRow(children: [
            Center(
              child: Text(
                element,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              color: Color(0xffE6EFFF),
              child: Center(
                  child: TextFormField(
                    controller: totalMarkControler[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff6789ca),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                    ),
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 18,
                    ),
                    textInputAction: TextInputAction.next,
                  ),
              ),
            ),
            Container(
              height: 50,
              color: Color(0xffB2CEFF),
              child: Center(
                  child: TextFormField(
                    controller: obtainMarkControler[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff2351ad),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                    ),
                    style: TextStyle(
                      fontFamily: "source sans pro",
                      fontSize: 18,
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (value){
                      changeValue=value;
                    },

                  ),
              ),
            ),
            Container(
              height: 50,
              color: Color(0xfffef4de),
              child: Center(
                child: TextFormField(
                  controller: gradeControl[i],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xfff78e3c),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                  ),
                  style: TextStyle(
                    fontFamily: "source sans pro",
                    fontSize: 18,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ]),
        );
        i++;
      });
      return data;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff2855ae), Color(0xff7292cf)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
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
                      "Add Results",
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
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Roll number",
                              style: TextStyle(
                                  color: Color(0xffa5a5a5), fontSize: 18),
                            )),
                        SizedBox(
                          height: 10,
                        ),
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
                                '01',
                                '02',
                                '03',
                                '04',
                                '05',
                                '06',
                                '07',
                                '08',
                                '09',
                                '10',
                                '11',
                                '12',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                "Select Student",
                                style: TextStyle(
                                  color: Color(0xffa5a5a5),
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                _chosenValue = value!;
                                setState(() {
                                  _chosenValue;
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        // for add result
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Add Result",
                                    style: TextStyle(
                                        color: Color(0xffa5a5a5), fontSize: 18),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  onPressed:changeValue.isEmpty?null: () {
                                    totalMarkControler.forEach((element) {
                                      totalMarks.add(element.text);
                                    });
                                    gradeControl.forEach((element) {
                                      grade.add(element.text);
                                    });
                                    obtainMarkControler.forEach((element) {
                                      gainMarks.add(element.text);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  disabledTextColor: Colors.grey,
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: changeValue.isEmpty?Colors.grey:Color(0xff2351ad), fontSize: 18),
                                  ),
                                  color: Color(0xffe6efff),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          // padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffE1E3E8),
                            ),
                          ),
                          margin: EdgeInsets.all(10),
                          child: _chosenValue!=null?Table(
                            columnWidths: {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(2),
                              3:FlexColumnWidth(2),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: getTableRow(),
                          ):Container(),
                        ),
                      ],
                    ),
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
