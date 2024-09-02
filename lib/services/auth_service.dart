import 'dart:developer';
import 'package:final_project_group4/controller/loading_controller.dart';
import 'package:final_project_group4/controller/points_controller.dart';
import 'package:final_project_group4/controller/user_controller.dart';
import 'package:final_project_group4/controller/waste_controller.dart';
import 'package:final_project_group4/services/redeem_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  LoadingController loadingController = LoadingController();
  WasteController wasteController = WasteController();
  UserController userController = UserController();
  PointsController pointsController = PointsController();
  RedeemService redeemService = RedeemService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<bool> deleteUserAccount(
      String userId, String email, String password) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      UserCredential authResult =
          await user!.reauthenticateWithCredential(credential);
      var result = await deleteAllUserData(userId);
      if (result == true) {
        await authResult.user!.delete();
        return true;
      } else {
        log('Kesalahan dalam menghapus data pengguna');
        return false;
      }
    } catch (e) {
      log('Error on Auth Service : $e');
      return false;
    }
  }

  Future<bool> deleteAllUserData(String userId) async {
    try {
      await pointsController.deleteUserPoints(userId);
      await redeemService.deleteAllData(userId);
      await wasteController.deleteAllData(userId);
      await userController.deleteUser(userId);
      return true;
    } on Exception catch (e) {
      // TODO
      log('Error on AuthService: $e');
      return false;
    }
  }
}
