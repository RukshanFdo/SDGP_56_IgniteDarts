import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  static String? _uid = '';
  String? _email = '';

  GoogleSignInAccount get user => _user!;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String root = 'error';

    try {
      User _firebaseUser = _auth.currentUser!;
      _uid = _firebaseUser.uid;
      _email = _firebaseUser.email;
      log('Log: onStartUp - uid: $_uid, email: $_email');
      root = 'success';
    } catch (e) {
      log('Log: onStartUp - $e');
    }
    return root;
  }

  Future<String> signOut() async {
    String root = 'error';

    try {
      await _auth.signOut();
      _uid = null;
      _email = null;
      log('Log: SignOut - uid: $_uid, email: $_email');
      root = 'success';
    } catch (e) {
      log(e.toString());
    }
    return root;
  }

  Future<String?> returnUid() async {
    try {
      User _firebaseUser = _auth.currentUser!;
      _uid = _firebaseUser.uid;
    } catch (e) {
      log('Log: onStartUp - $e');
    }
    return _uid;
  }

  Future googleLogin() async {
    await googleSignIn.signOut();
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
