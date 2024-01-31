import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_with_other/view/homepage.dart';
import 'package:login_with_other/view/loginpage.dart';

// ignore: camel_case_types
class firebaseAuth {
  User? user;
  
  FirebaseAuth fireauth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Register Finction
  Future<User?> register({
    required String email, 
    required String password, 
    required String fullName,
    required String phoneNumber,
    }  ) async {
    try{
    UserCredential userCredential = await fireauth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName.trim(),
        'phoneNumber': phoneNumber.trim(),
        'email': email.trim(),
      });
    userCredential.user?.uid;
    }catch (error) {
    SnackBar(content: Text("$error"));
  }
    return null;
  }

Future<User?> login(BuildContext? context, String email, String password) async {
  try{
    UserCredential userCredential = await fireauth.signInWithEmailAndPassword(
        email: email, password: password);

    if(userCredential.user?.uid != null){
      // ignore: use_build_context_synchronously
      return Navigator.push(
          context!, MaterialPageRoute(builder: (context) => const Home()));
    }
  }
  on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      print('Invalid email or password');
    } else {
      print('Error: $e');
    }
  }
}

  signOut(BuildContext context){
    fireauth.signOut();
    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  emailExist() async{
   await FirebaseFirestore.instance.collection("users").where("email", isEqualTo: user!.email).get();
  }

  //
  Future<UserCredential> signInWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        code: 'Facebook Login Failed',
        message: 'The Facebook login was not successful.',
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase authentication exceptions
    print('Firebase Auth Exception: ${e.message}');
    throw e; // rethrow the exception
  } catch (e) {
    // Handle other exceptions
    print('Other Exception: $e');
    throw e; // rethrow the exception
  }
}

}