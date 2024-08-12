import 'dart:developer';
import 'package:final_project_group4/controller/loading_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  LoadingController loadingController = LoadingController();
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      log("Something went wrong: $e ");
      loadingController.closeLoadingDialog();
      if (e.code == 'invalid-email') {
        loadingController.showAlertDialog(
            'Gagal', 'Data yang dimasukkan tidak valid');
      } else {
        loadingController.showAlertDialog('Gagal', 'Email telah digunakan');
      }
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
      loadingController.closeLoadingDialog();
      loadingController.showAlertDialog('Gagal', 'Data tidak ditemukan');
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
