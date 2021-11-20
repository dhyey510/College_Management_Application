import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cspit_sgp/models/Faculty.dart';
import 'package:cspit_sgp/models/Student.dart';

class DatabaseService{

  String uid;
  bool isStudent;

  DatabaseService({required this.uid, required this.isStudent});

  CollectionReference get obj {
    if (isStudent) {
      return FirebaseFirestore.instance.collection('Student');
    } else {
      return FirebaseFirestore.instance.collection('Faculty');
    }
  }

  Future updateUserData(dynamic setobj) async {
    // print("inside"+setobj);
    if (isStudent) {
      return await obj.doc(uid).set({
        'name': setobj.name,
        'email':setobj.email,
        'phone':setobj.contactNumber,
        'DOB':setobj.dateOfBirth,
        'rollNumber':setobj.rollNumber,
        'gender':setobj.gender,
        'address':setobj.address,
        'photo':setobj.photo,
        'department':setobj.department,
      }).then((value) => print('added'));
    } else {
      return await obj.doc(uid).set({
        'name': setobj.name,
        'email':setobj.email,
        'phone':setobj.phone,
        'DOB':setobj.DOB,
        'classTeacher':setobj.classTeacher,
        'gender':setobj.gender,
        'address':setobj.address,
        'photo':setobj.profileImg,
      }).then((value) => print("added"));
    }
  }


  //stream for student
  Stream<Student> get getcurrentStudent {
    return obj.doc(uid).snapshots().map(_currentStudent);
  }

  Student _currentStudent(DocumentSnapshot snapshot) {
      return Student(
        name: snapshot.get('name'),
        dateOfBirth: snapshot.get('DOB'),
        gender: snapshot.get('gender'),
        contactNumber: snapshot.get('phone'),
        address: snapshot.get('address'),
        department: snapshot.get('department'),
        rollNumber: snapshot.get('rollNumber'),
        email: snapshot.get('email'),
      );
  }

  Stream<Faculty> get getcurrentFaculty {
    return obj.doc(uid).snapshots().map(_currentFaculty);
  }

  Faculty _currentFaculty(DocumentSnapshot snapshot) {
    return Faculty(
      name: snapshot.get('name'),
      DOB: snapshot.get('DOB'),
      gender: snapshot.get('gender'),
      phone: snapshot.get('phone'),
      address: snapshot.get('address'),
      classTeacher: snapshot.get('rollNumber'),
      email: snapshot.get('email'),
      profileImg: snapshot.get('photo'),
    );
  }

  Future<Faculty>  get currentFaculty async{
    DocumentSnapshot snapshot = await obj.doc(uid).get();
    return Faculty(
      name: snapshot.get('name'),
      DOB: snapshot.get('DOB'),
      gender: snapshot.get('gender'),
      phone: snapshot.get('phone'),
      address: snapshot.get('address'),
      classTeacher: snapshot.get('classTeacher'),
      email: snapshot.get('email'),
      profileImg: snapshot.get('photo'),
    );
  }

}