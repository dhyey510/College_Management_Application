import 'package:flutter/material.dart';

class LeaveWidget extends StatefulWidget {
  String type,desc,from,to,name;
  bool isAccept;

  LeaveWidget({this.type='',this.desc='',this.from='',this.to='',this.isAccept=false,this.name=''});

  @override
  _LeaveWidgetState createState() => _LeaveWidgetState();
}

class _LeaveWidgetState extends State<LeaveWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffe1e3e8)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // for studentname & type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: Color(0xff313131),
                      fontFamily: "source sans pro",
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                padding: EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 5),
              ),
              Container(
                child: Text(
                  widget.type,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "source sans pro",
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff6789ca),
                ),
                margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
              ),
            ],
          ),

          // For date
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "From:  ${widget.from}",
                  style: TextStyle(
                      color: Color(0xff313131),
                      fontFamily: "source sans pro",
                      fontSize: 15,),
                ),
                padding: EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 5),
              ),
              Container(
                child: Text(
                  "To:  ${widget.to}",
                  style: TextStyle(
                      color: Color(0xff313131),
                      fontFamily: "source sans pro",
                      fontSize: 15,),
                ),
                // margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
              ),
            ],
          ),


          // for descr
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Text(
                  widget.desc,
                  style: TextStyle(
                      color: Color(0xff777777),
                      fontFamily: "source sans pro",
                      fontSize: 13),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                width: 300,
              ),
            ),
          ),

          // for signature
          Spacer(),
          widget.isAccept
              ? GestureDetector(
            onTap: (){
              setState(() {
                widget.isAccept=!widget.isAccept;
              });
            },
                child: Container(
            width: double.infinity,
            height: 36,
            child: Text(
                "Accepted",
                style: TextStyle(
                    color: Color(0xff003849),
                    fontFamily: "source sans pro",
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color:
                Color(0xffe1e3e8).withOpacity(0.89),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(top: 10),
          ),
              )
              : GestureDetector(
            onTap: (){
              setState(() {
                widget.isAccept=!widget.isAccept;
              });
            },
            child: Container(
            width: double.infinity,
            height: 36,
            child: Text(
                "Not Accepted",
                style: TextStyle(
                    color: Color(0xff2351ad),
                    fontFamily: "source sans pro",
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Color(0xffd4e2ff),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(top: 10),
          ),
              ),
        ],
      ),
    );
  }
}
