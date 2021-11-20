import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class CourseDetailsScreen extends StatefulWidget {
  static final String id = 'CourseDetailsScreen';
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  List<String> chapter = [
    "CHAPTER 1",
    "CHAPTER 2",
    "CHAPTER 3",
    "CHAPTER 4",
    "CHAPTER 5",
    "CHAPTER 6"
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Subject Details',
      body: ListView.builder(
        itemCount: chapter.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            child: Center(
                child: Text(
              chapter[index],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            width: 341,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFFDCE6F2),
            ),
          );
        },
      ),
    );
  }
}
