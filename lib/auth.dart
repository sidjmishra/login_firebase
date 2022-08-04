import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signInDemo(String email, String password) async {
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user!.uid;
    } on FirebaseAuthException catch (error) {
      print(error.code);
    }
  }

  signUpDemo(String email, String password) async {
    try {
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user!.uid;
    } on FirebaseAuthException catch (error) {
      print(error.code);
    }
  }

  signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
