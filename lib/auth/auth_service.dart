import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
    String email, String password
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong: $e ");
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
    String email, String password
  ) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }

  Future<String?> getCurrentUserId() async {
    try {
      User? user = _auth.currentUser;
      return user?.uid;
    } catch (e) {
      log("Error dengan user ID: $e");
      return null;
    }
  }
}