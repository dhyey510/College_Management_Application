import 'package:cspit_sgp/screens/students/mainmenu_screen.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class CourseRegiScreen extends StatefulWidget {
  static final String id = "/CourseRegiScreen";
  @override
  _CourseRegiScreenState createState() => _CourseRegiScreenState();
}

class _CourseRegiScreenState extends State<CourseRegiScreen> {
  String selectCourse='Blockchain Technology';
  bool isRegi=true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Course Registration",
      body: Container(
        child: Column(
          children: [
            // detail
            Container(
              margin: EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 10),
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08), blurRadius: 4, spreadRadius: 1),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 90,
                        child: Text("ID",style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 18,color: Colors.black45),),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 150,
                        child: Text('18IT030',style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 18),),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 90,
                        child: Text("Name",style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 18,color: Colors.black45),),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 150,
                        child: Text('Dhyey Desai',style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 18),),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 90,
                        child: Text("Semester",style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 18,color: Colors.black45),),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 150,
                        child: Text('04',style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 18),),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // select course
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  Container(child: Text("Select Elective Course",style: TextStyle(fontFamily: "Source Sans Pro",fontSize: 20,fontWeight: FontWeight.w700),)),
                  SizedBox(height: 20,),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.79,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(left: 15,right: 15),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectCourse,
                        elevation: 5,
                        style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: "Source Sans Pro"),
                        items: <String>[
                          'Blockchain Technology',
                          'Artificial Intelligent',
                          'Fundamental Of Networking',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectCourse = value!;
                          setState(() {
                            selectCourse=value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            // submit
            isRegi?RoundedButton(
              title: "Submit",
              onPressed: (){
                Navigator.of(context).pop();
              },
            ):MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              elevation: 8.0,
              padding: EdgeInsets.all(15.0),
              color: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: () => (){},
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
