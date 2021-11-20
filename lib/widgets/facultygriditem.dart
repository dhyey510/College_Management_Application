import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  String name;
  String icon;
  int index;
  String route;
  var studentProfile;

  GridItem({this.name='', this.icon='', required this.index,required this.route,this.studentProfile});

  // List screen=[homeWork,]

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(studentProfile!=null){
          Navigator.of(context).pushNamed(route,arguments: {"student":studentProfile});
        }else{
          Navigator.of(context).pushNamed(route);
        }
      },
      child: Container(
        width: 90,
        height: 118,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xffeeeeff),
                ),
                Image.asset(icon),
              ],
            ),
            SizedBox(height: 5,),
            Text(name,style: TextStyle(fontFamily: "source sans pro",fontSize: 18,),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
