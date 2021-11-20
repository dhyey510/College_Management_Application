import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class PlacementScreen extends StatefulWidget {
  static final String id = "/PlacementScreen";

  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Placement',
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffe1e3e8),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
              height: 120,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/gallery1.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Crest Data',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.where_to_vote_sharp,size: 16,color: Color(0xff777777),),
                            SizedBox(width: 5,),
                            Text(
                              'Vasi, Ahmedabad',
                              style: TextStyle(color: Color(0xff777777), fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.people,size: 16,color: Colors.blue[600],),
                            SizedBox(width: 5,),
                            Text(
                              '1000 Employees',
                              style: TextStyle(color: Colors.blue[600], fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.money,size: 16,color: Colors.deepOrange,),
                            SizedBox(width: 5,),
                            Text(
                              '5.5 LPA - 6.0 LPA',
                              style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
