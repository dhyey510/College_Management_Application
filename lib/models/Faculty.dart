import 'package:flutter/foundation.dart';

class Faculty{
  String name = '',
      email = '',
      DOB = '',
  classTeacher='',
      phone = '',
      address = '',
      gender = '',
      password = '',
      profileImg = '';
  List<String> OtherClasses = [];

  Faculty(
      {this.name = '',
      this.email = '',
        this.classTeacher='',
      this.profileImg = '',
      this.address = '',
      this.password = '',
      this.DOB = '',
      this.phone = '',
      this.gender = ''});


  void updateFaculty(Faculty faculty) {
    this.address = faculty.address;
    this.name = faculty.name;
    this.DOB = faculty.DOB;
    this.phone = faculty.phone;
    this.email = faculty.email;
    this.profileImg = faculty.profileImg;
    this.classTeacher=faculty.classTeacher;
    this.gender = faculty.gender;
    this.password=faculty.password;
  }

}
