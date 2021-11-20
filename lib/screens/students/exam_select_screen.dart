import 'package:cspit_sgp/screens/students/examschedule_screen.dart';
import 'package:cspit_sgp/screens/students/result_Screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';

class ExamSelect extends StatefulWidget {
  static final String id = "/SelectExam";

  @override
  _ExamSelectState createState() => _ExamSelectState();
}

class _ExamSelectState extends State<ExamSelect> {
  String _chosenValue='Unit Test 1';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Exam",
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text("Select Exam",style: TextStyle(color: Colors.grey,fontSize: 19,fontFamily: "Source Sans Pro"),),
            ),
            SizedBox(height: 10,),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.5)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(left: 15,right: 15),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _chosenValue,
                  elevation: 5,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  items: <String>[
                    'Unit Test 1',
                    'Unit Test 2',
                    'External Exam',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _chosenValue = value!;
                    setState(() {
                      _chosenValue=value;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 50,),

            RoundedButton(
              title: "Exam Schedule",
              onPressed: (){
                Navigator.of(context).pushNamed(ExamScheduleScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
