import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:flutter/painting.dart';

class ExamScheduleScreen extends StatelessWidget {
  static final String id = 'ExamScheduleScreen';

  final List examSchedule = [
    {'date': "11 May", 'sub': "IOT", 'time': '12:00 PM - 3:00 PM'},
    {'date': "17 May", 'sub': "Data Science", 'time': '12:00 PM - 3:00 PM'},
    {'date': "21 May", 'sub': "SGP", 'time': '12:00 PM - 3:00 PM'},
    {
      'date': "11 Jun",
      'sub': "Blockchain Technology",
      'time': '12:00 PM - 3:00 PM'
    },
    {
      'date': "17 Jun",
      'sub': "Advance Computing",
      'time': '12:00 PM - 3:00 PM'
    },
    {
      'date': "11 Jul",
      'sub': "Language Processing",
      'time': '12:00 PM - 3:00 PM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Exam Schedule',
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: examSchedule.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 80,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08), blurRadius: 4, spreadRadius: 1),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Text(
                        examSchedule[index]['date'],
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 5,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 15,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(examSchedule[index]['sub'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: "Source Sans Pro"),),
                          Text(examSchedule[index]['time'],style: TextStyle(fontSize: 14,color: Colors.black54,fontFamily: "Source Sans Pro"),),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

// Row(
// children: [
// Expanded(
// child: Container(
// padding: EdgeInsets.only(left: 10, top: 5),
// child: Text(
// element['sub'],
// style: TextStyle(
// fontSize: 16,
// color: Color(0xff313131),
// ),
// ),
// ),
// ),
// Expanded(
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xff6ac259).withOpacity(0.11),
// ),
// padding: EdgeInsets.all(3),
// child: Text(
// element['date'],
// // value.toString(),
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 16,
// color: Color(0xff3a3a3a),
// fontWeight: FontWeight.bold),
// ),
// ),
// ),
// ],
// ),
