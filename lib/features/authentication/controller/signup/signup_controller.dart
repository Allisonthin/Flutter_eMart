import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/authentication/screens/signUpScreen/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/helper/network_manager.dart';
import '../../../../utils/popups/fullscreen_loader.dart';
import '../../../../utils/popups/loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variable
  final hidePassword = true.obs; // observable for showing/hiding Password
  final privacyPolicy = true.obs; // observable for privacy policy checkbox
  final email = TextEditingController(); // controller for email input
  final firstName = TextEditingController(); // controller for firstname input
  final lastName = TextEditingController(); // controller for lastname input
  final userName = TextEditingController(); // controller for username input
  final password = TextEditingController(); // controller for password input
  final phoneNumber = TextEditingController(); // controller for phoneNumber input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP --

  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information", TImages.docerAnimation);

      // check internet Connectivity
      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy check
      if (!privacyPolicy.value) {
        TLoader.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to create account you must accept the Privacy Policy and Terms of Use");
        return;
      }

      // register user in firebase authentication and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated data in firebase fireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      TFullScreenLoader.stopLoading();

      // show success message
    TLoader.successSnackBar(title: "Congratulation", message: "Your account has been created verify email to continue.");

      // move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));



    } catch (e) {

      //remove loader
      TFullScreenLoader.stopLoading();

      // show some generic error to the user
      TLoader.errorSnackBar(title: "oh snap!", message: e.toString());
    }
  }
}
