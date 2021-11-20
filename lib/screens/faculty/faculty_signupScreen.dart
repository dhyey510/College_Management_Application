import 'package:cspit_sgp/screens/faculty/faculty_dashboard.dart';
import 'package:cspit_sgp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/models/Faculty.dart';
import 'package:cspit_sgp/screens/loading_screen.dart';
import 'package:cspit_sgp/widgets/DropDown.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';
import 'package:cspit_sgp/widgets/TextInput.dart';

class FacultySignUpScreen extends StatefulWidget {
  static final String id = 'FacultySignUpScreen';

  const FacultySignUpScreen({Key? key}) : super(key: key);

  @override
  _FacultySignUpScreenState createState() => _FacultySignUpScreenState();
}

class _FacultySignUpScreenState extends State<FacultySignUpScreen> {
  AuthService auth = AuthService();

  var _signUPFormKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  String _teacherID = 'Nehal Patel';
  var KEmailForFacultyRegx=
      '[a-zA-Z]{2,}.it@charusat.ac.in';
  var kPasswordValidationRegex = '^[a-zA-Z0-9@_-]{7}';
  var kPhoneValidationRegex = '^[0-9]{10}';
  var kGenderList = [
    {'ID': 'Male', 'name': 'Male'},
    {'ID': 'Female', 'name': 'Female'},
    {'ID': 'Others', 'name': 'Others'}
  ];

  String _gender = 'Male';

  bool _isLoading = false;
  bool _isObscure = true;

  // void getTeacherList() async {
  //   var res = await NetworkHelper.getData(path: 'studentModule/teacherlist.php');
  //   if (res['status']) {
  //     print(res['data']);
  //     setState(() {
  //       teacherList = res['data'];
  //       _teacherID = res['data'][0]['ID'];
  //       _isLoading = false;
  //     });
  //   } else {
  //     // Navigator.pushReplacementNamed(context, DashBoardScreen.id);
  //   }
  // }

  @override
  void initState() {
    // getTeacherList();
    super.initState();
  }

  void signUp() async {

    if (_signUPFormKey.currentState!.validate()) {
      //   List<String> name = _nameController.text.trim().split(' ');
      Faculty faculty = Faculty(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        DOB: _dobController.text.trim(),
        classTeacher: _rollNoController.text.trim(),
        password: _passwordController.text.trim(),
        address: _addressController.text.trim(),
        gender: _gender,
      );

      dynamic result = await auth.registerWithEmailAndPassword(faculty.email, faculty.password,false,faculty);
      if (result == null) {
        SnackBar snackBar = SnackBar(
          content: Text(
            'Already have an account',
            style: TextStyle(fontSize: 16.0),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        SnackBar snackBar = SnackBar(
          content: Text(
            'Create account successfully',
            style: TextStyle(fontSize: 16.0),
          ),
          backgroundColor: Colors.teal,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacementNamed(context, FacultyDashboardScreen.id);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SIGN UP!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40.0),
                        ),
                        Container(
                          width: 85.0,
                          child: Divider(
                            color: Color(0xff3f4094),
                            thickness: 5.0,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _signUPFormKey,
                          child: Column(
                            children: [
                              TextInput(
                                hintText: 'John H. Doe',
                                labelText: 'Full Name',
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
                                  } else if (!RegExp(KEmailForFacultyRegx,
                                          caseSensitive: false)
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
                                        } else if (!RegExp(
                                                kPhoneValidationRegex,
                                                caseSensitive: false)
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
                                        List<String> date =
                                            _dobController.text.split('-');
                                        DateTime selectedDate = date.length > 1
                                            ? DateTime(
                                                int.parse(date[0]),
                                                int.parse(date[1]),
                                                int.parse(date[2]),
                                              )
                                            : DateTime.now();
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              selectedDate, // Refer step 1
                                          firstDate: DateTime(1930),
                                          lastDate: DateTime.now(),
                                        );
                                        if (picked != null &&
                                            picked != selectedDate)
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
                                      hintText: '18IT',
                                      labelText: 'Class',
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
                              // DropDown(
                              //   title: 'Class Teacher',
                              //   value: _teacherID,
                              //   items: teacherList,
                              //   onChange: (String? newValue) {
                              //     setState(() {
                              //       _teacherID = newValue!;
                              //       print(newValue);
                              //     });
                              //   },
                              // ),
                              TextInput(
                                hintText: 'Password',
                                labelText: 'Password',
                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                                textInputType: TextInputType.text,
                                validatorFunction: (String str) {
                                  if (str.isEmpty) {
                                    return 'This field cannot be empty.';
                                  } else if (!RegExp(kPasswordValidationRegex,
                                          caseSensitive: false)
                                      .hasMatch(str)) {
                                    return ('Invalid Password.');
                                  }
                                  return null;
                                },
                                isPassword: _isObscure,
                                textEditingController: _passwordController,
                              ),
                              TextInput(
                                hintText:
                                    'Street 1, Street 2, City, Pin, State',
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
                              Row(
                                children: [
                                  Expanded(
                                      child: RoundedButton(
                                          onPressed: signUp,
                                          title: 'Create Account')),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'New User For Application? ',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
