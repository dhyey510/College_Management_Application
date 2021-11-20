import 'package:cspit_sgp/screens/faculty/faculty_dashboard.dart';
import 'package:cspit_sgp/screens/faculty/faculty_signupScreen.dart';
import 'package:cspit_sgp/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cspit_sgp/widgets/TextInput.dart';
import 'package:cspit_sgp/widgets/RoundedButton.dart';
import 'package:cspit_sgp/screens/students/dashboard_screen.dart';
import 'package:cspit_sgp/screens/students/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum RadioValue { Faculty, Student, user }

class _LoginScreenState extends State<LoginScreen> {

  AuthService auth = AuthService();

  // LoginType _loginType = LoginType.Email;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var kEmailValidationRegex =
      r'^d*[1-2]\dIT[0-1]\d{2}@charusat.edu.in';
  var KEmailForFacultyRegx=
      '[a-zA-Z]{2,}.it@charusat.ac.in';
  var kPasswordValidationRegex =
      '^[a-zA-Z0-9@_-]{7}';

  bool _isObscure = true;
  RadioValue? grpvalue = RadioValue.Student;

  var _emailFormKey = GlobalKey<FormState>();

  void login() async {
    if(grpvalue == RadioValue.Student){
      if(_emailFormKey.currentState!.validate()){
        dynamic result = await auth.signInWithEmailAndPassword(
            _emailController.text.trim(), _passwordController.text.trim(),true);
        if (result == null) {
          SnackBar snackBar = SnackBar(
            content: Text(
              'No such account found',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }else{
          SnackBar snackBar = SnackBar(
            content: Text(
              'Login Successfull',
              style: TextStyle(fontSize: 16.0),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).popAndPushNamed(DashBoardScreen.id);
        }
      }
    }else if(_emailFormKey.currentState!.validate()) {
      dynamic result = await auth.signInWithEmailAndPassword(
          _emailController.text.trim(), _passwordController.text.trim(),false);
      if (result == null) {
        SnackBar snackBar = SnackBar(
          content: Text(
            'No such account found',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        SnackBar snackBar = SnackBar(
          content: Text(
            'Login Successfull',
            style: TextStyle(fontSize: 16.0),
          ),
          backgroundColor: Colors.teal,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).popAndPushNamed(FacultyDashboardScreen.id);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset('assets/images/logo1.png'),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                      color: Color(0xfffafafa),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 35,
                            spreadRadius: 1),
                      ],
                    ),
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // for select option

                            Container(
                              padding: EdgeInsets.only(top: 20,bottom: 20),
                              // height: 10,
                              // width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: RadioValue.Student,
                                          activeColor: Colors.indigo,
                                          groupValue: grpvalue,
                                          onChanged: (RadioValue? value) {
                                            setState(() {
                                              grpvalue = value;
                                            });
                                          }),
                                      Text(
                                        "Student",
                                        style: TextStyle(
                                            fontFamily: 'Source Sans Pro',
                                            fontSize: 18,
                                            fontWeight: grpvalue==RadioValue.Student?FontWeight.w600:FontWeight.normal,
                                            color: grpvalue==RadioValue.Student? Colors.indigo:Colors.black,),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<RadioValue>(
                                        value: RadioValue.Faculty,
                                        activeColor: Colors.indigo,
                                        groupValue: grpvalue,
                                        onChanged: (RadioValue? value) {
                                          setState(() {
                                            grpvalue = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Faculty",
                                        style: TextStyle(
                                            color: grpvalue==RadioValue.Faculty?Colors.indigo:Colors.black,
                                            fontFamily: 'Source Sans Pro',
                                          fontWeight: grpvalue==RadioValue.Faculty?FontWeight.w600:FontWeight.normal,
                                            fontSize: 18,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(bottom: 15.0),
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                key: _emailFormKey,
                                child: Column(
                                  children: [
                                    TextInput(
                                      hintText: 'abc@mail.com',
                                      labelText: 'Email',
                                      textInputType: TextInputType.emailAddress,
                                      validatorFunction: (String str) {
                                        if (str.isEmpty) {
                                          return 'This field cannot be empty.';
                                        }else if (grpvalue==RadioValue.Student){
                                          if(!RegExp(kEmailValidationRegex, caseSensitive: false).hasMatch(str)) {
                                            return ('Invalid Email.');
                                          }
                                        }else if(grpvalue==RadioValue.Faculty){
                                          if(!RegExp(KEmailForFacultyRegx, caseSensitive: false).hasMatch(str)) {
                                            return ('Invalid Email.');
                                          }
                                        }
                                        return null;
                                      },
                                      isPassword: false,
                                      textEditingController: _emailController,
                                    ),
                                    TextInput(
                                      hintText: 'Password',
                                      labelText: 'Password',
                                      suffix: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                        child: _isObscure?Icon(
                                          Icons.remove_red_eye_rounded,
                                          color: Colors.grey,
                                        ):Icon(Icons.visibility_off,color: Colors.grey,),
                                      ),
                                      textInputType: TextInputType.text,
                                      validatorFunction: (String str) {
                                        if (str.isEmpty) {
                                          return 'This field cannot be empty.';
                                        } else if (!RegExp(kPasswordValidationRegex, caseSensitive: false).hasMatch(str)) {
                                              return ('Invalid Password.');
                                        }
                                        return null;
                                      },
                                      isPassword: _isObscure,
                                      textEditingController:
                                          _passwordController,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:30.0),
                                    child: RoundedButton(
                                      onPressed: login,
                                      title: 'LOGIN',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New User For Application? ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Source Sans Pro'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if(RadioValue.Student == grpvalue){
                                      Navigator.pushNamed(context, SignUpScreen.id);
                                    }else{
                                     Navigator.pushNamed(context, FacultySignUpScreen.id);
                                    }
                                  },
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.indigoAccent,
                                        fontFamily: 'Source Sans Pro'),
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
      ),
    );
  }
}
