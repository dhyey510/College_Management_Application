import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/students/AddLeaveApplicationScreen.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class LeaveApplicationScreen extends StatefulWidget {
  static final String id = 'LeaveApplicationScreen';

  @override
  _LeaveApplicationScreenState createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      fab: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddLeaveApplicationScreen.id);
        },
        backgroundColor: Color(0xff3f4094),
        child: Icon(Icons.add),
      ),
      title: 'Leave Applications',
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medical Leave',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '07-08-2020 - 09-08-2020',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Due to high fever I will not able to come',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffe1e3e8).withOpacity(0.89),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Approved",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
