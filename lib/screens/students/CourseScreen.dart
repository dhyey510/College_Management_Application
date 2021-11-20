import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/students/CourseDetailsScreen.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class CourseScreen extends StatefulWidget {
  static final String id = 'CourseScreen';
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<String> courses = ["Language Processing", "Advance Computing", "Data Science"];
  final _colors = [
    Color(0xFFFEF4DE),
    Color(0xFFFBDAE3),
    Color(0xFFE6EFFF),
  ];
  final textcolor = [Color(0xFFF78E3C), Color(0xFFFB1956), Color(0xFF2351AD)];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Subjects',
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext ctx, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CourseDetailsScreen.id);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  courses[index],
                  style: TextStyle(
                      fontSize: 22, color: textcolor[index % textcolor.length]),
                ),
              ),
              height: 100,
              width: 341,
              decoration: BoxDecoration(
                  color: _colors[index % _colors.length],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          );
        },
      ),
    );
  }
}
