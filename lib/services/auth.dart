import 'package:cspit_sgp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cspit_sgp/models/Student.dart';
import 'package:cspit_sgp/models/CommonUser.dart';

class AuthService{
  final FirebaseAuth auth = FirebaseAuth.instance;


   CommonUser _userFromFirebaseUser(User? user){
      if (user !=null) {
        print("insisde null user");
        return CommonUser(uid: user.uid);
      }else{
        return CommonUser(uid: '');
      }
  }

  Stream<CommonUser> get user{
     print("call");
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in with email password

  Future signInWithEmailAndPassword(String email, String password, bool isStudent) async{
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  // register with email password
  Future registerWithEmailAndPassword(String email, String password, bool isStudent, dynamic obj ) async{
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      await DatabaseService(uid: user!.uid,isStudent: isStudent).updateUserData(obj);
      print(obj);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // signout

  Future signout() async{
    try {
      print("logout");
      return await auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}