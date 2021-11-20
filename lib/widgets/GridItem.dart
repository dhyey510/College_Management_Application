import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String icon;
  final int index;
  final String route;

  const GridItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
    this.route='',
    // required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 70,
              width: 70,
              child: Image.asset(icon),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
