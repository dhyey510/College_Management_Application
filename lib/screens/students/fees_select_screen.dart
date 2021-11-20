import 'package:cspit_sgp/screens/students/fees_screen.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';

class FeesSelect extends StatefulWidget {
  static final String id = "/SelectFees";
  @override
  _FeesSelectState createState() => _FeesSelectState();
}

class _FeesSelectState extends State<FeesSelect> {
  String _chosenValue='01';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Fees",
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text("Select Year",style: TextStyle(color: Colors.grey,fontSize: 19,fontFamily: "Source Sans Pro"),),
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
              title: "Fees Detail",
              onPressed: (){
                Navigator.of(context).pushNamed(FeesScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
