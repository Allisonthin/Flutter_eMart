

import 'dart:io';

import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

/// repository class for user-related operation
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save data in Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("user").doc(user.id).set(user.toJson());
    } catch (e) {
      throw "something went wrong. Please try again";
    }
  }

  /// Function to fetch user detail based on user id.
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("user")
          .doc(AuthenticationRepository.instance.authuser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw "something went wrong. Please try again";
    }
  }

  /// function to update user data in firebase
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("user")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } catch (e) {
      throw "something went wrong. Please try again";
    }
  }

  /// update any field in specific Users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("user")
          .doc(AuthenticationRepository.instance.authuser!.uid)
          .update(json);

      
    } catch (e) {
      throw "something went wrong. Please try again";
    }
  }

  /// function to remove user data from firebase
  Future<void> removeUserDetails(String userid) async{
    try{
      await _db.collection("user").doc(userid).delete();
    }catch(e){
      throw "something went wrong. Please try again";
    }
  }

  /// uplaod any image to firebase storage
  Future<String> uploadImage(String path ,XFile image) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw "something went wrong. Please try again";
    }
  }
}
