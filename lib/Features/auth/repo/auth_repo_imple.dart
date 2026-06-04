import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ieee/Features/auth/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> login(String email, String password) async {
    try {
     final userCredential =await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
         DateTime loginTime = DateTime.now();
      final userId = _firebaseAuth.currentUser?.uid ?? "";
      final userDoc = await FirebaseFirestore.instance.collection("users").doc(userId).get();
      final userName = userDoc["username"] ?? "No username found";
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", userName);

      User? authUser = userCredential.user;

      print("Creation Time: \${authUser?.metadata.creationTime}");
      print("Last Sign In: \${authUser?.metadata.lastSignInTime}");
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
      final userId = NewUser.user?.uid ?? "No user id found";
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
