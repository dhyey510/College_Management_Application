import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';
import 'package:cspit_sgp/widgets/TextInput.dart';

class AddLeaveApplicationScreen extends StatefulWidget {
  static final String id = 'AddLeaveApplicationScreen';
  const AddLeaveApplicationScreen({Key? key}) : super(key: key);

  @override
  _AddLeaveApplicationScreenState createState() =>
      _AddLeaveApplicationScreenState();
}

class _AddLeaveApplicationScreenState extends State<AddLeaveApplicationScreen> {
  GlobalKey<FormState> _leaveApplicationKey = GlobalKey<FormState>();

  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  String _type = 'Medical';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'New Application',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _leaveApplicationKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextInput(
                              hintText: '',
                              labelText: 'From',
                              suffix: Icon(
                                Icons.calendar_today_rounded,
                                color: Colors.grey,
                              ),
                              textInputType: TextInputType.datetime,
                              validatorFunction: (String str) {
                                if (str.isEmpty)
                                  return 'This field can not be empty.';
                                else
                                  return null;
                              },
                              textEditingController: _fromController,
                              isPassword: false,
                              isReadOnly: true,
                              onClick: () async {
                                List<String> date =
                                    _fromController.text.split(' / ');
                                DateTime selectedDate = date.length > 1
                                    ? DateTime(
                                        int.parse(date[2]),
                                        int.parse(date[1]),
                                        int.parse(date[0]),
                                      )
                                    : DateTime.now();
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate, // Refer step 1
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050),
                                );
                                if (picked != null && picked != selectedDate)
                                  setState(() {
                                    selectedDate = picked;
                                    _fromController.text =
                                        '${picked.day} / ${picked.month} / ${picked.year}';
                                    _toController.clear();
                                  });
                              },
                            ),
                          ),
                          Expanded(
                            child: TextInput(
                              hintText: '',
                              labelText: 'To',
                              suffix: Icon(
                                Icons.calendar_today_rounded,
                                color: Colors.black,
                              ),
                              textInputType: TextInputType.datetime,
                              validatorFunction: (String str) {
                                if (str.isEmpty)
                                  return 'This field can not be empty.';
                                else
                                  return null;
                              },
                              textEditingController: _toController,
                              isPassword: false,
                              isDisabled:
                                  _fromController.text.isEmpty ? true : false,
                              isReadOnly: true,
                              onClick: () async {
                                List<String> date =
                                    _toController.text.split(' / ');
                                List<String> fromDate =
                                    _fromController.text.split(' / ');
                                DateTime fDate = DateTime(
                                  int.parse(fromDate[2]),
                                  int.parse(fromDate[1]),
                                  int.parse(fromDate[0]),
                                );
                                DateTime selectedDate = date.length > 1
                                    ? DateTime(
                                        int.parse(date[2]),
                                        int.parse(date[1]),
                                        int.parse(date[0]),
                                      )
                                    : fDate;
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate, // Refer step 1
                                  firstDate: fDate,
                                  lastDate: DateTime(2050),
                                );
                                if (picked != null && picked != selectedDate)
                                  setState(() {
                                    selectedDate = picked;
                                    _toController.text =
                                        '${picked.day} / ${picked.month} / ${picked.year}';
                                  });
                              },
                            ),
                          )
                        ],
                      ),
                      // DropDown(
                      //   title: 'Type',
                      //   value: _type,
                      //   items: [
                      //     'Medical',
                      //     'Family Emergency',
                      //     'Family Function',
                      //     'Other'
                      //   ],
                      //   onChange: (String value) {
                      //     setState(() {
                      //       _type = value;
                      //     });
                      //   },
                      // ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.5)),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.only(left: 10,top:20),
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              value: _type,
                              // elevation: 5,
                              // style: TextStyle(color: Colors.black, fontSize: 18),
                              items: <String>[
                                'Medical',
                                'Family Function',
                                'Emergency',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                "Select type of leave",
                                style: TextStyle(
                                  color: Color(0xffa5a5a5),
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value){
                                setState(() {
                                  _type=value!;
                                });
                              }
                          ),
                        ),
                      ),
                      TextInput(
                        hintText: 'Reason',
                        labelText: 'Reason',
                        textInputType: TextInputType.text,
                        validatorFunction: (String str) {
                          if (str.isEmpty)
                            return 'This field can not be empty.';
                          else
                            return null;
                        },
                        textEditingController: _reasonController,
                        isPassword: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RoundedButton(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                onPressed: () {
                  if (_leaveApplicationKey.currentState!.validate()) {
                    print('valid');
                  }
                },
                title: 'Submit'),
          ],
        ));
  }
}
