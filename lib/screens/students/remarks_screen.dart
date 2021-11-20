import 'package:flutter/material.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/models/Remark.dart';

class RemarkScreen extends StatefulWidget {
  static final String id = "RemarkScreen";

  @override
  _RemarkScreenState createState() => _RemarkScreenState();
}

class _RemarkScreenState extends State<RemarkScreen> {
  List<Remark> _remarksList = [
    Remark(
        subjectName: "Advance Computing",
        description: "Absent in last 5 lectures continuously",
        status: false),
    Remark(
        subjectName: "IOT",
        description: "Not good performance in iot subject",
        status: true),
  ];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : CustomScaffold(
            title: 'Remarks',
            body: _remarksList.length == 0
                ? Center(
                    child: Text('No remarks found.'),
                  )
                : ListView.builder(
                    // padding: EdgeInsets.symmetric(vertical: 15),
                    itemCount: _remarksList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _remarksList[index].subjectName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    _remarksList[index].description,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (!_remarksList[index].status)
                                  setState(() {
                                    _remarksList[index].status =
                                        !_remarksList[index].status;
                                  });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffe1e3e8).withOpacity(0.89),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: double.infinity,
                                child: Text(
                                  _remarksList[index].status
                                      ? 'Completed'
                                      : "Parent's Signature",
                                  style: TextStyle(
                                      color: _remarksList[index].status
                                          ? Colors.green
                                          : Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
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
