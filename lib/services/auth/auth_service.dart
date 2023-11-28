import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signIn(email, password) async {
    try {
      UserCredential data = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return data;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<UserCredential> signUp(name, phoneNumber, email, password) async {
    try {
      UserCredential data = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firestore.collection('users').doc(data.user?.uid).set({
        'uid': data.user?.uid,
        'email': data.user?.email,
        'name': name,
        'phone_num': phoneNumber
      }, SetOptions(merge: true));
      return data;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
