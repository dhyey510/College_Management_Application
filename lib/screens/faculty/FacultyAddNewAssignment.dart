import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Assignment.dart';
import 'package:file_picker/file_picker.dart';

class AssignmentDetail extends StatefulWidget {
  static final id = '/FacultyNewAssignment';

  @override
  _AssignmentDetailState createState() => _AssignmentDetailState();
}

class _AssignmentDetailState extends State<AssignmentDetail> {
  // TextEditingController _questionController = TextEditingController();
  // TextEditingController _dueDateController = TextEditingController();
  String attach_name = "Add Attachments", question='', dueDate = "15-1-2020", desc='';
  bool isedit=false;
  int count=0;
  late Assignment assignment;
  List assignments=[];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argu = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    isedit = argu['edit'];
    if (isedit) {
      assignment = argu['assignmentobj'];
      attach_name=assignment.attachment;
    } else {
      assignments = argu['assignments'];
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
                          if (isedit) {
                            Navigator.pop(context, assignment);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      "Add Assignment",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "source pro sans",
                          color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  // margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // for title
                        Container(
                          child: Text(
                            "Question",
                            style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 16,
                                color: Color(0xffa5a5a5)),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        ),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xffe1e3e8),
                                ),
                              ),
                              hintText: "Enter Question",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16,
                            ),
                            onChanged: (value) {
                              setState(() {
                                question = value;
                              });
                            },
                            initialValue: isedit ? assignment.title : null,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Due Date",
                            style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 16,
                                color: Color(0xffa5a5a5)),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2025))
                                      .then((value) {
                                    setState(() {
                                      dueDate = value!.day.toString() +
                                          '-' +
                                          value.month.toString() +
                                          '-' +
                                          value.year.toString();
                                      // print(_date);
                                    });
                                  });
                                },
                                iconSize: 20,
                                color: Color(0xff777777),
                                icon: Icon(Icons.calendar_today_rounded),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffe1e3e8))),
                                width: 100,
                                height: 40,
                                child: Text(
                                  isedit ? assignment.dueDate : dueDate,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // description
                        Container(
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 16,
                                color: Color(0xffa5a5a5)),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        ),
                        Container(
                          height: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xffe1e3e8),
                                ),
                              ),
                              hintText: "Description",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                            style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 16,
                            ),
                            onChanged: (value) {
                              setState(() {
                                desc = value;
                              });
                            },
                            initialValue: isedit ? assignment.description : null,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Container(
                          child: Text(
                            "Attachment",
                            style: TextStyle(
                                fontFamily: "source sans pro",
                                fontSize: 16,
                                color: Color(0xffa5a5a5)),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        ),
                        GestureDetector(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf'],
                            );

                            if (result != null) {
                              PlatformFile file = result.files.first;
                              setState(() {
                                attach_name = file.name;
                              });

                              // print(nameofFile);
                            } else {}
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 40.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,size: 20,color: Color(0xff777777),),
                                SizedBox(width: 5,),
                                Text(
                                    attach_name,
                                    style: TextStyle(
                                      color: Color(0xff777777),
                                      fontFamily: "Source Sans Pro",
                                      fontSize: 16.0,
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        // button
                        MaterialButton(
                          minWidth: double.infinity,
                          elevation: 8.0,
                          padding: EdgeInsets.all(15.0),
                          color: Color(0xff2351ad),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            if (!isedit) {
                              Assignment e = Assignment(
                                  title: question, description: desc, dueDate: dueDate,id: count.toString(),subjectName: "English",issueDate: "07-02-2021",attachment:attach_name);
                              count++;
                              assignments.add(e);

                              Navigator.pop(context, assignments);
                            } else {
                              if (question.isNotEmpty) {
                                assignment.title = question;
                                print("inside edit");
                              }
                              if (desc.isNotEmpty) {
                                assignment.description = desc;
                                print("inside edit");
                              }
                              if (dueDate.isNotEmpty) {
                                assignment.dueDate = dueDate;
                              }
                              if(attach_name.compareTo("Add Attachments")>0){
                                assignment.attachment=attach_name;
                              }

                              Navigator.pop(context, assignment);
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
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
