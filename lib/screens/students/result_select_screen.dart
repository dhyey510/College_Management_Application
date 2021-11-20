import 'package:cspit_sgp/screens/students/result_Screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';
import 'package:cspit_sgp/screens/faculty/FacultyStudentResult.dart';

class ResultSelect extends StatefulWidget {
  static final String id = "/SelectResult";

  @override
  _ResultSelectState createState() => _ResultSelectState();
}

class _ResultSelectState extends State<ResultSelect> {
  String _chosenValue='01';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Result",
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text("Select Semester",style: TextStyle(color: Colors.grey,fontSize: 19,fontFamily: "Source Sans Pro"),),
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
                    '01',
                    '02',
                    '03',
                    '04',
                    '05',
                    '06',
                    '07',
                    '08',
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
                      _chosenValue=value;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 50,),

            RoundedButton(
              title: "Get Result",
              onPressed: (){
                Navigator.of(context).pushNamed(StudentResult.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
