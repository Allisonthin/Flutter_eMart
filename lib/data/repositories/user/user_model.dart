import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/utils/formatter/formatter.dart';

class UserModel {
  // keep those value final which i do not want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// UserModel constructor
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// helper function to get the full name
  String get fullName => "$firstName $lastName";

  /// helper function to get the format phoneNumber
  String get formatedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split fullName  into firstname and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static function to generate a username for firstname
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : " ";

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = "cwz_$camelCaseUserName";

    return userNameWithPrefix;
  }

  /// static function to create empty user model.
  static UserModel empty() => UserModel(
      id: "",
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  /// convert model to json structure for storing data in fireBase.
  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "UserName": userName,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "ProfilePicture": profilePicture,
      };

  /// factory method to create a usermode from a fireBase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    //if (document.data() != null){
    final data = document.data()!;
    return UserModel(
        id: document.id,
        firstName: data["FirstName"] ?? '',
        lastName: data["LastName"] ?? '',
        userName: data["UserName"] ?? '',
        email: data["Email"] ?? '',
        phoneNumber: data["PhoneNumber"] ?? '',
        profilePicture: data["ProfilePicture"] ?? '');
  //x }
  }
}
