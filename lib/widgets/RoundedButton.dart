import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final EdgeInsets padding;


  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.padding = const EdgeInsets.all(15.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        elevation: 8.0,
        padding: EdgeInsets.all(15.0),
        color: Color(0xff3f4094),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () => onPressed(),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
