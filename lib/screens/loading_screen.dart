import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff3f4094),
            backgroundColor: Color(0xfff4f4f4),
          ),
        ),
      ),
    );;
  }
}
