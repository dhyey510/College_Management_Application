import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Period.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';

class TimeTableScreen extends StatefulWidget {
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  String _selectedDay = 'Mon';
  List<Period> _periodList = [
    Period(
        timing: "09:10 AM - 10:10 AM",
        subjectName: "LP",
        isLunch: false,
        number: 1,
        teacherName: "Prof. Nirav Bhatt"),
    Period(
        timing: "10:10 AM - 11:10 AM",
        subjectName: "AC",
        isLunch: false,
        number: 2,
        teacherName: "Prof. Pritesh Prajapati"),
    Period(
        timing: "11:10 AM - 12:10 PM",
        subjectName: "Maths",
        isLunch: true,
        number: 3,
        teacherName: "Yash Patel"),
    Period(
        timing: "3:30 PM - 4:30 PM",
        subjectName: "IOT",
        isLunch: false,
        number: 4,
        teacherName: "Prof. Bimal Patel"),
  ];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            margin: EdgeInsets.only(top: 20),
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
                                      ? Color(0xff3f4094)
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    itemCount: _periodList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.grey.shade400,
                            )),
                        // Change container values if its lunch break
                        child: _periodList[index].isLunch
                            //Lunch Break Container layout
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Title and Time slot of lunch break
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lunch Break',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Divider(
                                        thickness: 0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            _periodList[index].timing,
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
                              )
                            //Contains of regular periods
                            : Column(
                                children: [
                                  // Row containing subject and time slot
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _periodList[index].subjectName,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            _periodList[index].timing,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 0.8,
                                  ),
                                  // Row for Teacher name and Period number
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _periodList[index].teacherName,
                                        style: TextStyle(
                                            fontSize: 16.0, color: Colors.grey),
                                      ),
                                      Text(
                                        'Lecture ${_periodList[index].number!}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
