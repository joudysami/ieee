import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieee/Features/auth/repo/auth_repo.dart';

class FirebaseAuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> login(String email, String password) {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> register(String email, String name, String password) async {
    try {
      final NewUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = NewUser.user?.uid ?? "";
      log('FirebaseAuth: created user id=$userId');
      await _firebaseFirestore.collection("users").doc(userId).set({
        "useremail": email,
        "username": name,
        "userid": userId,
      });
      log('Firestore: user document written for id=$userId');
    } catch (e) {
      log('FirebaseAuthRepoImpl.register error: $e');
      throw Exception(e.toString());
    }
  }
}
