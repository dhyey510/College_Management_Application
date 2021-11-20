import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:flutter/material.dart';

class FeesScreen extends StatefulWidget {
  static final String id = "/FeesScreeen";

  @override
  _FeesScreenState createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Fees Detail',
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            // for sem1
            Container(
              padding: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08), blurRadius: 4, spreadRadius: 1),
                ],
              ),
              child: Row(
                children: [
                  // sem
                  Container(
                    child: Column(
                      children: [
                        Text("S1",style: TextStyle(fontSize: 40,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.amber),),
                        SizedBox(height: 10,),
                        Container(
                          color: Colors.green,
                          padding: EdgeInsets.all(5),
                          width: 60,
                          child: Text('Paid',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),

                  // due date scholorship
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Due Date",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38),),
                              SizedBox(height: 1,),
                              Text("14/01/2022",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                        SizedBox(height: 13,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Scholarship",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38)),
                              SizedBox(height: 1,),
                              Text("1000",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                  // amount paid
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Amount",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38),),
                              SizedBox(height: 1,),
                              Text("5000",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                        SizedBox(height: 13,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Paid Fee",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38)),
                              SizedBox(height: 1,),
                              Text("1000",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // for sem2
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08), blurRadius: 4, spreadRadius: 1),
                ],
              ),
              child: Row(
                children: [
                  // sem
                  Container(
                    child: Column(
                      children: [
                        Text("S2",style: TextStyle(fontSize: 40,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.amber),),
                        SizedBox(height: 10,),
                        Container(
                          width: 60,
                          padding: EdgeInsets.all(5),
                          color: Colors.red,
                          child: Text('Unpaid',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),

                  // due date scholorship
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Due Date",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38),),
                              SizedBox(height: 1,),
                              Text("14/01/2022",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                        SizedBox(height: 13,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Scholarship",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38)),
                              SizedBox(height: 1,),
                              Text("1000",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                  // amount paid
                  SizedBox(width: 30,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Amount",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38),),
                              SizedBox(height: 1,),
                              Text("5000",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                        SizedBox(height: 13,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Paid Fee",style: TextStyle(fontSize: 14,fontFamily: "Source Sans Pro",fontWeight: FontWeight.w700,color: Colors.black38)),
                              SizedBox(height: 1,),
                              Text("1000",style: TextStyle(fontSize: 15,fontFamily: "Source Sans Pro",color: Colors.black45),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
