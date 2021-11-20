import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/DropDown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/widgets/CustomScaffold.dart';
import 'package:cspit_sgp/widgets/TextInput.dart';

class EditProfileScreen extends StatefulWidget {
  static final String id = 'EditProfileScreen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var _signUPFormKey = GlobalKey<FormState>();
  var kEmailValidationRegex = '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]{2,}.[a-zA-Z0-9]{2,}\$';
  var kPhoneValidationRegex = '^[0-9]{10}';

  var kGenderList = [
    {'ID': 'Male', 'name': 'Male'},
    {'ID': 'Female', 'name': 'Female'},
    {'ID': 'Others', 'name': 'Others'}
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  var teacherList=[
    {'ID': '01', 'name': 'Nehal Patel'},
    {'ID': '02', 'name': 'Sandip Patel'},
    {'ID': '03', 'name': 'Parth Shah'}
  ];

  String _teacher = '01';
  String _gender = 'Male';
  String _photo = '';

  bool _isImageLoading = false;
  bool _isLoading = false;

  @override
  void initState() {
    // getTeacherList();
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : CustomScaffold(
            title: 'My Profile',
            actions: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: Color(0xff3f4094),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "DONE",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3f4094),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            body: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ClipRRect(
                              child: _isImageLoading
                                  ? LoadingScreen()
                                  : _photo == ''
                                      ? Image.asset(
                                          'assets/images/profile.png',
                                          fit: BoxFit.contain,
                                        )
                                      : Image.memory(
                                          base64Decode(_photo),
                                          fit: BoxFit.contain,
                                        ),
                              //image
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF5278C1)),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "dhyey desai",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'CSPIT IT  |  ID NO: 18IT030',
                                // class and roll num
                                style: TextStyle(fontSize: 16, color: Color(0xFF777777)
                                    //fontWeight: FontWeight.bold
                                    ),
                              )
                            ],
                          ),
                          Container(
                              child: IconButton(
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: 22,
                              color: Color(0XFF777777),
                            ),
                            onPressed: (){},
                          ))
                        ],
                      ),
                    ),
                    Form(
                      key: _signUPFormKey,
                      child: Column(
                        children: [
                          TextInput(
                            hintText: 'John Doe',
                            labelText: 'Name',
                            textInputType: TextInputType.name,
                            validatorFunction: (String str) {
                              if (str.isEmpty)
                                return 'This field can not be empty.';
                              else
                                return null;
                            },
                            textEditingController: _nameController,
                            isPassword: false,
                          ),
                          TextInput(
                            hintText: 'jhondoe@mail.com',
                            labelText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            validatorFunction: (String str) {
                              if (str.isEmpty) {
                                return 'This field cannot be empty.';
                              } else if (!RegExp(kEmailValidationRegex, caseSensitive: false)
                                  .hasMatch(str)) {
                                return ('Invalid email.');
                              }
                              return null;
                            },
                            textEditingController: _emailController,
                            isPassword: false,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextInput(
                                  hintText: '9876543210',
                                  labelText: 'Contact Number',
                                  textInputType: TextInputType.phone,
                                  validatorFunction: (String str) {
                                    if (str.isEmpty) {
                                      return 'This field cannot be empty.';
                                    } else if (!RegExp(kPhoneValidationRegex, caseSensitive: false)
                                        .hasMatch(str)) {
                                      return ('Invalid Contact Number.');
                                    }
                                    return null;
                                  },
                                  textEditingController: _phoneController,
                                  isPassword: false,
                                ),
                              ),
                              Expanded(
                                child: DropDown(
                                  title: 'Gender',
                                  value: _gender,
                                  items: kGenderList,
                                  onChange: (String? newValue) {
                                    setState(() {
                                      _gender = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextInput(
                                  hintText: '',
                                  labelText: 'Date Of Birth',
                                  textInputType: TextInputType.datetime,
                                  validatorFunction: (String str) {
                                    if (str.isEmpty)
                                      return 'This field can not be empty.';
                                    else
                                      return null;
                                  },
                                  textEditingController: _dobController,
                                  isPassword: false,
                                  isReadOnly: true,
                                  onClick: () async {
                                    List<String> date = _dobController.text.split('-');
                                    DateTime selectedDate = date.length > 1
                                        ? DateTime(
                                            int.parse(date[0]),
                                            int.parse(date[1]),
                                            int.parse(date[2]),
                                          )
                                        : DateTime.now();
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate, // Refer step 1
                                      firstDate: DateTime(1930),
                                      lastDate: DateTime.now(),
                                    );
                                    if (picked != null && picked != selectedDate)
                                      setState(() {
                                        selectedDate = picked;
                                        _dobController.text =
                                            '${picked.year}-${picked.month}-${picked.day}';
                                      });
                                  },
                                ),
                              ),
                              Expanded(
                                child: TextInput(
                                  hintText: 'D19CE152',
                                  labelText: 'Roll Number',
                                  textInputType: TextInputType.name,
                                  validatorFunction: (String str) {
                                    if (str.isEmpty)
                                      return 'This field can not be empty.';
                                    else
                                      return null;
                                  },
                                  textEditingController: _rollNoController,
                                  isPassword: false,
                                ),
                              ),
                            ],
                          ),
                          DropDown(
                            title: 'Class Teacher',
                            value: _teacher,
                            items: teacherList,
                            onChange: (String? newValue) {
                              setState(() {
                                _teacher = newValue!;
                                print(newValue);
                              });
                            },
                          ),
                          TextInput(
                            hintText: 'Street 1, Street 2, City, Pin, State',
                            labelText: 'Address',
                            textInputType: TextInputType.streetAddress,
                            validatorFunction: (String str) {
                              if (str.isEmpty)
                                return 'This field can not be empty.';
                              else
                                return null;
                            },
                            textEditingController: _addressController,
                            isPassword: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
