import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String title;
  final String value;
  final List<dynamic> items;
  final Function onChange;

  const DropDown({
    Key? key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
          ),
          DropdownButton<String>(
            isExpanded: true,
            itemHeight: 51.5,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.5,
            ),
            underline: Container(
              margin: EdgeInsets.only(top: 0.0),
              height: 1,
              color: Colors.grey.shade500,
            ),
            value: value,
            items: items.map<DropdownMenuItem<String>>((var item) {
              return DropdownMenuItem<String>(
                value: item['ID'].toString(),
                child: Text(item['name']),
              );
            }).toList(),
            onChanged: (String? newValue) {
              onChange(newValue);
            },
          ),
        ],
      ),
    );
  }
}
