import 'dart:ui';

import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/personalisation/controller/user_controller.dart';
import 'package:e_mart/features/personalisation/screens/Profile/profile.dart';
import 'package:e_mart/utils/helper/network_manager.dart';
import 'package:e_mart/utils/popups/fullscreen_loader.dart';
import 'package:e_mart/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constant/image_string.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController =  UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appear
  @override
  void onInit() {

    initializeName();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeName() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;

  }

  /// update username
 Future<void> updateUserName() async{
    try{
      // start screen loader
      TFullScreenLoader.openLoadingDialog("We are updating your information", TImages.docerAnimation);

      //check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // update firstname and lastname in firebase fireStore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(),  'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // update rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      TFullScreenLoader.stopLoading();
      
      // show success message
      TLoader.successSnackBar(title: "Congratulation", message: "Your name has been updated");

      // move to profile screen
      Get.off(() => const ProfileScreen());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "oh snap", message: e.toString());
    }
 }
  
}