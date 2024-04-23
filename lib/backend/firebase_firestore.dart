import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_store/models/user_model.dart';

class FirebaseFirestoreHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //final FirebaseAuthHelper _firebaseAuthHelper = FirebaseAuthHelper();
  Future<void> createUser(
    String name,
    String email,
    String address,
    String password,
    String userId,
  ) async {
    try {
      UserModel user = UserModel(
        id: userId,
        name: name,
        address: address,
        email: email,
      );
      Map<String, dynamic> userData = user.toJson();
      await _firebaseFirestore
          .collection('Users Accounts')
          .doc(userId)
          .set(userData);
    } catch (e) {
      print(e.toString());
    }
  }
}
