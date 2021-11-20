import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final fab;
  final bool isBGImage;

  const CustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.actions = const <Widget>[],
    this.fab,
    this.isBGImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3f4094),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff3f4094),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: actions,
        ),
        body: Container(
          decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
          child: body,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          margin: EdgeInsets.only(top: 20),
        ),
        floatingActionButton: fab,
      ),
    );
  }
}
