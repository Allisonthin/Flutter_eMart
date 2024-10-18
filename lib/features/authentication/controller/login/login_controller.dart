
import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/personalisation/controller/user_controller.dart';
import 'package:e_mart/utils/helper/network_manager.dart';
import 'package:e_mart/utils/popups/fullscreen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/popups/loader.dart';

class LoginController extends GetxController {
  // variable
  final hidePass = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());


  @override
  void onInit() {

    super.onInit();
    // emailController.text = localStorage.read("REMEMBER_ME_EMAIL");
    // passwordController.text = localStorage.read("REMEMBER_ME_PASSWORD");
  }

  /// email and password signin
  Future<void> emailAndPasswordSignin() async {
    try {
      // start loader
      TFullScreenLoader.openLoadingDialog(
          "Logging you in ... ", TImages.docerAnimation);

      // check connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", emailController.text.trim());
        localStorage.write(
            "REMEMBER_ME_PASSWORD", passwordController.text.trim());
      }

      // login user using email and password authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "oh snap", message: e.toString());
    }
  }

  /// google signIn authentication
  Future<void> googleSignIn() async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog("Logging you in ....", TImages.docerAnimation);

      // check connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      TFullScreenLoader.stopLoading();

      TLoader.successSnackBar(title: "congrate", message: "sign with google successfully");

      // redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "ohh snap.. ", message: e.toString());
    }
  }
}
