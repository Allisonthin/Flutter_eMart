import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_mart/utils/helper/network_manager.dart';
import 'package:e_mart/utils/popups/fullscreen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/popups/loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEmail() async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);

      // check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResendEmail(email.text.trim());

      // remove screen loader
      TFullScreenLoader.stopLoading();
      
      // show success screen
      TLoader.successSnackBar(title: "Email send", message: "Email link sent to reset your password".tr);

      // screen redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));



    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "oh snap...", message: e.toString());
    }
  }

  resentPasswordResetEmail(String email)async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);

      // check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }


      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResendEmail(email);

      // remove screen loader
      TFullScreenLoader.stopLoading();

      // show success screen
      TLoader.successSnackBar(title: "Email resend", message: "Email link resent to reset your password");




    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "oh snap...", message: e.toString());
    }
  }
}