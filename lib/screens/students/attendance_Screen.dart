import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:pie_chart/pie_chart.dart';

class AttendanceScreen extends StatefulWidget {
  static final String id = 'AttendanceScreen';
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Map<String, double> ScoreAttendance = {
    "Internet Of Things": 96,
    "Advance Computing": 87,
    "Language Processing": 85,
    "BlockChain Technology": 78,
    "Software Group Project": 89,
    "Data Science": 92
  };

  @override
  Widget build(BuildContext context) {
    List<TableRow> data = [];
    double overallAttendance = 0.0;

    ScoreAttendance.forEach((key, value) {
      overallAttendance = overallAttendance + value;
      data.add(TableRow(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              key,
              style: TextStyle(
                  fontFamily: "source pro snas",
                  fontSize: 14,
                  color: Color(0xff313131)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff6ac259).withOpacity(0.11),
            ),
            padding: EdgeInsets.all(5),
            child: Text(
              value.ceil().toString() + " %",
              // value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "source pro snas",
                  fontSize: 14,
                  color: Color(0xff3a3a3a),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ));
    });

    var percantageAttendance = overallAttendance / ScoreAttendance.length;

    return CustomScaffold(
      title: 'Attendance ',
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffe1e3e8)),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10),
              child: Table(
                columnWidths: {0: FlexColumnWidth(7)},
                children: data,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                margin: EdgeInsets.only(left: 15, top: 7),
                child: Text(
                  "Overall Attendance",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "source sans pro"),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: PieChart(
                dataMap: ScoreAttendance,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 2.5,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 50,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  legendTextStyle: TextStyle(
                    fontFamily: "source sans pro",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffd4e2ff),
                ),
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "${percantageAttendance.ceil()}%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "source sans pro",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2855ae),
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
