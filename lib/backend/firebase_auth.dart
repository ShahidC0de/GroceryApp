import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  // creating an object of FirebaseAuth initialized through dependency firebase_auth;
  // allows us to use some function while signing in or creating account of the user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // for sigining in the user through email and password;
  Future<bool> createTheUser(String email, String password) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return false;
    }
  }

  Future<bool> sigInTheUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return false;
    }
  }
  // this function is responsible to get the current user id  (who's logged in);

  Future<String> getCurrentUserId() async {
    String userId = _firebaseAuth.currentUser!.uid;
    return userId;
  }
  // // getting the stream of user being created in the firebase;

  Stream<User?> get getAuthChange => _firebaseAuth.authStateChanges();
}
