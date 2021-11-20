import 'package:flutter/foundation.dart';

class Student{
  String name = '';
  String email = '';
  String contactNumber = '';
  String dateOfBirth = '';
  String rollNumber = '';
  String gender = '';
  String address = '';
  String password = '';
  String photo = '';
  String department = '';

  Student({
    this.name = '',
    this.email = '',
    this.contactNumber = '',
    this.dateOfBirth = '',
    this.rollNumber = '',
    this.address = '',
    this.password = '',
    this.photo = '',
    this.gender = '',
    this.department = 'CSPIT IT',
  });


  void updateStudent(Student student) {
    this.address = student.address;
    this.name = student.name;
    this.dateOfBirth = student.dateOfBirth;
    this.contactNumber = student.contactNumber;
    this.email = student.email;
    this.rollNumber = student.rollNumber;
    this.photo = student.photo;
    this.gender = student.gender;
  }

}
