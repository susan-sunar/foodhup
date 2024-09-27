import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass{
  FirebaseAuth _auth =FirebaseAuth.instance;

  ///signup
Future<User?>signUpWithEmailAndPassword(
    String email,String password)async{
  try{ UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
  return credential.user;
  } catch (e) {
    debugPrint("Some error happened");
  }
  return null;
}

///signin
Future<User?>signInWithEmailAndPassword(
    String email,String password)async{
  try {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  } catch (e) {
    debugPrint("Some error happened");
  }
  return null;
}

///logout
void logout() async {
  await FirebaseAuth.instance.signOut();
}


  ///google signin
  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAllNamed('/home');
  }

  void google_signout() async {
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().signOut();
    }
    try {
      await GoogleSignIn().disconnect();
    } catch (e) {
      debugPrint("Something is wrong: $e");
    }
  }

  ///phone
  void sendOtp(String phone) {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (e) {
        debugPrint("Error: $e");
      },
      codeSent: (String verificationID, int? forceResendingToken) {
        Get.toNamed('/otp', arguments: verificationID);
      },
      codeAutoRetrievalTimeout: (verificationID) {
        debugPrint("Code timeout");

      },
    );
  }

  void verifyNumber(String verificationCode, String otp) {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: otp,
      );
      _auth.signInWithCredential(credential);
      Get.offAllNamed('/home');
    } catch (e) {
      debugPrint('Error happened: $e');
    }
  }
}






