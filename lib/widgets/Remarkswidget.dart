import 'package:flutter/material.dart';

class Remarks extends StatefulWidget {
  String sub,desc;
  bool Signature;

  Remarks({this.sub='',this.desc='',this.Signature=false});

  @override
  _RemarksState createState() => _RemarksState();
}

class _RemarksState extends State<Remarks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154,
      margin:
      EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffe1e3e8)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // for subname
          Container(
            child: Text(
              widget.sub,
              style: TextStyle(
                  color: Color(0xff313131),
                  fontFamily: "source sans pro",
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            padding: EdgeInsets.only(
                top: 10, left: 15, right: 15, bottom: 5),
          ),

          // for descr
          Container(
            child: Text(
              widget.desc,
              style: TextStyle(
                  color: Color(0xff777777),
                  fontFamily: "source sans pro",
                  fontSize: 13),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: 3),
            width: 300,
          ),

          // for signature
          Spacer(),
          widget.Signature
              ? Container(
            width: double.infinity,
            height: 36,
            child: Text(
              "Completed",
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
          )
              : Container(
            width: double.infinity,
            height: 36,
            child: Text(
              "Parent's Signature",
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
        ],
      ),
    );
  }
}
