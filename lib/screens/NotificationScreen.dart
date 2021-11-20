import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';

class NotificationScreen extends StatelessWidget {
  static final id = "NotificationScreen";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Notification',
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Assignment Assigned',
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
