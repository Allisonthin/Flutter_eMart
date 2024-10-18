import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_model.dart';
import 'package:e_mart/features/authentication/screens/loginScreen/login.dart';
import 'package:e_mart/features/personalisation/screens/Profile/widgets/reAuth_user_Login_form.dart';
import 'package:e_mart/utils/popups/fullscreen_loader.dart';
import 'package:e_mart/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/sizes.dart';
import '../../../utils/helper/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRespository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await UserRepository.instance.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? credentials) async {
    try {
      // first update the rx user and then click if user data is already stored. if not store new data
      await fetchUserRecord();

      //if no record already store
      if(user.value.id.isEmpty){

      if (credentials != null) {
        // convert name to first and last name
        final namePart =
            UserModel.nameParts(credentials.user!.displayName ?? " ");
        final userName =
            UserModel.generateUserName(credentials.user!.displayName ?? " ");

        // map data
        final user = UserModel(
            id: credentials.user!.uid,
            firstName: namePart[0],
            lastName: namePart.length > 1 ? namePart.sublist(1).join(" ") : " ",
            userName: userName,
            email: credentials.user!.email ?? " ",
            phoneNumber: credentials.user!.phoneNumber ?? " ",
            profilePicture: credentials.user!.photoURL ?? "");

        // save user repository
        await userRespository.saveUserRecord(user);
      }}
    } catch (e) {
      TLoader.warningSnackBar(
          title: "Data not save",
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  // delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSize.lg),
      title: 'Account Deleted',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSize.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text("Cancel"))
    );
  }

  // delete user account
  void deleteUserAccount() async{
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);

      /// first reauthenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authuser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // re verify auth email.
        if(provider == "google.com"){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }
        else if( provider == "password"){
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "oh snap bajasdfk", message: e.toString());
    }
  }

  // reAuthenticated before deleting account
  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);

      //check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(()=> const LoginScreen());

    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: "oh snap", message: e.toString());
    }
  }

  // upload profile picture
  updateUserProfilePicture() async{
    
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        // upload image
        final imageUrl = await userRespository.uploadImage(
            'Users/Image/Profile', image);

        // update user image record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl
        };
        await userRespository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        
        TLoader.successSnackBar(title: 'Congratulation', message: "Your profile image has been update successfully");
      }
    }catch(e){
      TLoader.errorSnackBar(title: "oh snap", message: e.toString());
    }

  }
}
