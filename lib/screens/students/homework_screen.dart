import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Homework.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/screens/students/homework_detail_screen.dart';

class HomeWorkScreen extends StatefulWidget {
  @override
  _HomeWorkScreenState createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  bool _isLoading = false;
  // var colors=[Color(0xffC70101),Color(0xff0587D0),Color(0xff41BC94),Color(0xffFFA301)];
  List<Homework> _homeworkList = [
    Homework(
        description: "write equation of lexical chain",
        title: "Assignment on lex resources",
        attachment: "practical.pdf",
        dueDate: "03 June 2021",
        dueTime: "11:59 PM",
        id: "1",
        subjectName: "Language Processing"),
    Homework(
        description: "complete gcp lab within 1 hour",
        title: "Complete ac practical",
        attachment: "ac1.pdf",
        dueDate: "04 July 2021",
        dueTime: "04:00 PM",
        id: "2",
        subjectName: "Advance Computing"),
  ];

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              margin: EdgeInsets.only(top: 20),
              child: _homeworkList.length == 0
                  ? Center(
                      child: Text('No homework found.'),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(20.0),
                      itemCount: _homeworkList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, HomeWorkDetailScreen.id, arguments: _homeworkList[index]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.only(bottom: 20.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffE6EFFF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    _homeworkList[index].subjectName,
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _homeworkList[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Due  ${_homeworkList[index].dueDate.toString()} ' + " . "+ ' ${_homeworkList[index].dueTime.toString()}',style: TextStyle(fontSize: 14,fontFamily: 'Source Sans Pro'),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
  }
}
