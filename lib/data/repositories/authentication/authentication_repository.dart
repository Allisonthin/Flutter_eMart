import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/authentication/screens/OnBoarding/onBoarding.dart';
import 'package:e_mart/features/authentication/screens/loginScreen/login.dart';
import 'package:e_mart/features/authentication/screens/signUpScreen/verify_email.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constant/image_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authuser => _auth.currentUser;

  /// call from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// function to show relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.off(() => const NavigationMenu());
      } else {
        Get.off(() => const VerifyEmailScreen());
      }

    }
    else{
      /// local storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }


  }

  /*--------------------- email & password sign-in ---------------------------*/

  /// [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Todo: //dafdj;
      throw Exception(e);
    }
  }


  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Todo: //dafdj;
      throw Exception(e);
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  /// [ReAuthenticate] - ReAuthentication user
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password)async{
    try {
      // create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // reauthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }


  /// [EmailAuthentication] - Forgot Password
  Future<void> sendPasswordResendEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  /*------------------------------------------- Federal Identity & social signin --------------------------*/
  /// [GoogleAuthentication] - Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // trigger authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain auth detail from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // once signed in return the userCredential
      return await _auth.signInWithCredential(credentials);



    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  /// [FacebookAuthentication] - Facebook

  /*------------------------------------------- ./ end Federal identity & social sign in ---------------------*/
  /// [Logout] - valid for any authentication

  Future<void> logout() async {
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }catch(e){
      throw "Something went wrong. Please try again.";
    }
  }

 ///  [deleteUser] - Remove user auth and fireStore account
  Future<void> deleteAccount() async{
    try {
      await UserRepository.instance.removeUserDetails(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }
}
