import 'package:flutter/cupertino.dart';
import 'package:grocery_store/backend/firebase_auth.dart';
import 'package:grocery_store/backend/firebase_firestore.dart';

class ServiceProvider extends ChangeNotifier {
  // INSTANCES.......................
  final FirebaseAuthHelper _firebaseAuthHelper = FirebaseAuthHelper();
  final FirebaseFirestoreHelper _firebaseFirestoreHelper =
      FirebaseFirestoreHelper();
//..................................................................................
// FUNCTIONS...........................................................................
  Future<bool> creatingTheUser(
      String name, String address, String email, String password) async {
    bool isUserCreated =
        await _firebaseAuthHelper.createTheUser(email, password);
    if (isUserCreated) {
      String id = await _firebaseAuthHelper.getCurrentUserId();
      _firebaseFirestoreHelper.createUser(
        name,
        email,
        address,
        password,
        id,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signingInTheUser(String email, String password) async {
    try {
      await _firebaseAuthHelper.sigInTheUser(email, password);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return false;
    }
  }
}
