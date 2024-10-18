
/// Custom exception class to handle various firebase authentication-related errors
class TFirebaseAuthException implements Exception{

  /// error code associated with the exception
  final String code;

  /// constructor that take the error code
  TFirebaseAuthException(this.code);

  /// get the corresponding error message base on the error code
  String get message{
    switch(code){
      case 'email-already in use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email addressed provided is invalid. Please enter the valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disable':
        return 'The user account has been disable. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification id. Please request a new verification code.';
      case 'quote-exceeded':
        return 'Quote exceeded. Please try again later.';
      case 'email-already-exist':
        return 'The email address is already exist. Please use different email.';
      case 'provider-already-link':
        return 'The account is already linked with another provider.';
      default:
        return "Unknown Authentication error. Please try again later.";
    }
  }
}