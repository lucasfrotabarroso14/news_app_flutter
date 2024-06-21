

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices{
  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try{

      UserCredential credential  = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;

    } catch(e){
      print("Some error occured");
    }
    return null;

  }


  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try{

      UserCredential credential  = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;

    } catch(e){
      print("Some error occured");
    }
    return null;

  }

  Future<void> signOut() async {
    try{
      await _auth.signOut();
    }catch(e){
      print("Error signing out: $e");
    }
  }




}