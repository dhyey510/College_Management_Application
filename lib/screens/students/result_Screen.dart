import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class ResultScreen extends StatefulWidget {
  static final id = 'ResultScreen';
  final String standard;

  const ResultScreen({Key? key, this.standard = 'X'}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Result",
      body: Container(
        child: Column(
          children: [

            // for details
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(child: Text("Name ")),
                      SizedBox(width: 30,),
                      Container(child: Text("Dhyey Desai")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(child: Text("ID")),
                      SizedBox(width: 30,),
                      Container(child: Text("18IT030")),
                    ],
                  ),
                  Row(),
                ],
              ),
            ),

            // for result
            Container(),

            // for sgpa
            Container(),
          ],
        ),
      ),
    );
  }
}
