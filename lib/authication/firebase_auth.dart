import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_with_other/view/loginpage.dart';

// ignore: camel_case_types
class firebaseAuth {
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

Future<User?> login(String email, String password) async {
  try{
    UserCredential userCredential = await fireauth.signInWithEmailAndPassword(
        email: email, password: password);
    // if(userCredential.user?.uid != null){
    //   return null;
    // }

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

  //
  Future<UserCredential?> signInWithFacebook(BuildContext context) async {
    try {
      // Trigger the Facebook login process
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (loginResult.status == LoginStatus.success) {
        // Get the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Sign in with Facebook credentials
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

        return userCredential;
      } else {
        // Handle login failure
        print('Facebook login failed. Status: ${loginResult.status}');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      print('Firebase Authentication Error: $e');
      return null;
    }
  }

}