import 'package:flutter/material.dart';

class StudentProfileMain extends StatefulWidget {

  var student;

  StudentProfileMain(this.student);

  @override
  _StudentProfileMainState createState() => _StudentProfileMainState();
}

class _StudentProfileMainState extends State<StudentProfileMain> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Name",
                      style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 14,
                          color: Color(0xffa5a5a5)),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 5),
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          size: 20,
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffe1e3e8),
                          ),
                        ),
                        hintText: "Enter Name",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                      ),
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 18,
                      ),
                      onChanged: (value) {
                        setState(() {
                         widget.student.name = value;
                        });
                      },
                      initialValue:
                      widget.student.name == null ? "Akshay Jain" : widget.student.name,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // phone
            Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Phone",
                      style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 14,
                          color: Color(0xffa5a5a5)),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 5),
                  ),
                  Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.call,
                          size: 20,
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffe1e3e8),
                          ),
                        ),
                        hintText: "Enter Phone",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                      ),
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 18,
                      ),
                      onChanged: (value) {
                        setState(() {
                          widget.student.phone = value;
                        });
                      },
                      initialValue: widget.student.phone == null
                          ? "+915678987656"
                          : widget.student.phone,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // roll & DOB
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "ID NO",
                          style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              color: Color(0xffa5a5a5)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffe1e3e8),
                              ),
                            ),
                            hintText: "Roll Number",
                            contentPadding:
                            EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10),
                          ),
                          style: TextStyle(
                            fontFamily: "source sans pro",
                            fontSize: 18,
                          ),
                          onChanged: (value) {
                            setState(() {
                              widget.student.roll = value;
                            });
                          },
                          initialValue:
                          widget.student.roll == null ? "18094" : widget.student.roll,
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),

                  // dob
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "DOB",
                          style: TextStyle(
                              fontFamily: "source sans pro",
                              fontSize: 14,
                              color: Color(0xffa5a5a5)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){},
                              // onPressed: () {
                              //   showDatePicker(
                              //       context: context,
                              //       initialDate:
                              //       DateTime.now(),
                              //       firstDate:
                              //       DateTime(2000),
                              //       lastDate:
                              //       DateTime(2025))
                              //       .then((value) {
                              //     setState(() {
                              //       print("inside");
                              //       widget.student.dob = value;
                              //       // print(_date);
                              //     });
                              //   });
                              // },
                              iconSize: 20,
                              color: Color(0xff777777),
                              icon: Icon(
                                  Icons.calendar_today_rounded),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                      Color(0xffe1e3e8))),
                              width: 100,
                              height: 40,
                              child: Text(
                                widget.student.dob,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),

            // address
            Container(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontFamily: "source sans pro",
                          fontSize: 14,
                          color: Color(0xffa5a5a5)),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 5),
                  ),
                  Container(
                    height: 70,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffe1e3e8),
                          ),
                        ),
                        hintText: "Enter Address",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                      ),
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "source sans pro",
                        fontSize: 18,
                      ),
                      onChanged: (value) {
                        setState(() {
                          widget.student.address = value;
                          // print(address);
                        });
                      },
                      initialValue: widget.student.address == null
                          ? "skajhd, hdhuaii majshd-2 majhhdb"
                          : widget.student.address,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
