import 'package:cspit_sgp/models/Faculty.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Period.dart';
import 'package:cspit_sgp/screens/faculty/faculty_studentList.dart';

class FacultyTimeTable extends StatefulWidget {
  Faculty teacher;
  FacultyTimeTable({required this.teacher});

  // static final String id = 'TimeTableScreen';

  @override
  State<FacultyTimeTable> createState() => _FacultyTimeTableState();
}

class _FacultyTimeTableState extends State<FacultyTimeTable> {
  String _selectedDay = 'Mon';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff2855ae), Color(0xff7292cf)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),

        Container(
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
        child: Column(
          children: [
            // Weekday tabs container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              child: Row(
                children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                    .map(
                      (String day) => Expanded(
                    //Change selected day when a day tab is clicked
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = day;
                        });
                      },
                      // Container for Each day
                      child: Container(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          // Change background color when selected day changes
                          color: day == _selectedDay
                              ? Color(0xFF2351AD)
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            day,
                            style: TextStyle(
                              fontSize: 15.0,
                              // Change text color when selected day changes
                              color: day == _selectedDay
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
            // Time Table List View
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                // Static List of periods
                children: [
                  Period(
                    number: 1,
                    subjectName: 'BT',
                    classname: '7IT1',
                    timing: '08:15am - 9:00am',
                    isLunch: false,
                  ),
                  Period(
                    number: 1,
                    subjectName: 'IOT',
                    classname: '7IT2',
                    timing: '08:15am - 9:00am',
                    isLunch: false,
                  ),
                  Period(
                    number: 1,
                    subjectName: 'SGP',
                    classname: '5IT1',
                    timing: '08:15am - 9:00am',
                    isLunch: false,
                  ),
                  Period(
                    timing: '08:15am - 9:00am',
                    isLunch: true,
                  ),
                  Period(
                    number: 1,
                    subjectName: 'Data Science',
                    classname: '3IT1',
                    timing: '08:15am - 9:00am',
                    isLunch: false,
                  ),
                  Period(
                    number: 1,
                    subjectName: 'Language Processing',
                    classname: '7IT1',
                    timing: '08:15am - 9:00am',
                    isLunch: false,
                  ),
                  Period(
                    number: 1,
                    subjectName: 'Advance Computing',
                    classname: '5IT2',
                    timing: '08:15am - 9:00am',
                    isLunch: false,
                  ),
                ].map((Period p) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        )),
                    child: p.isLunch ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title and Time slot of lunch break
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lunch Break',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              thickness: 0,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  p.timing,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Image for Lunch break
                        Image.asset(
                          'assets/images/lunch_break.png',
                          fit: BoxFit.cover,
                        )
                      ],
                    ) : GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(FacultyStudentList.id,arguments: {'type':true});
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            // Row containing subject and time slot
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  p.subjectName,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      p.timing,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xffdbdbdb),
                              thickness: 0.82,
                            ),
                            // Row for Teacher name and Period number
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  p.classname,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
                                ),
                                Text(
                                  'Period ${p.number}',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    ],
    );
  }
}
