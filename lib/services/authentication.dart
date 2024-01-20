import 'package:app_cooking/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  static AppUser? userFromFirebase(User? user){
    return user != null ? AppUser(uid: user.uid, displayName: user.displayName): null;  
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map((event) => userFromFirebase(event));
  }

  Future signInEmail(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future<User?> signUpEmail({required String name,  required String email, required String password}) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      await user.updateDisplayName(name);
      await saveUser(user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> saveUser(User user) async {
    try {
      await FirebaseFirestore.instance
      .collection('users').doc(user.uid).set(
        {
          'id': user.uid,
          'username': _auth.currentUser!.displayName ?? "null"
        }
      );
    } on Exception catch (e) {
      print(e.toString());
      print("erreur save");
    }
  }
}