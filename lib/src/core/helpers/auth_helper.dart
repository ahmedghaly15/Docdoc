import 'app_regex.dart';

class AuthHelper {
  static String? validatingEmailField({String? value}) {
    if (value == null || value.isEmpty) {
      return "Email can't be blank!";
    } else if (!AppRegex.isEmailValid(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatingPasswordField({String? value}) {
    if (value == null || value.isEmpty) {
      return "Password can't be blank!";
    } else if (!AppRegex.isPasswordValid(value)) {
      return "Please enter a valid password";
    }
    return null;
  }

  static String? validatePhoneField({String? value}) {
    if (value == null || value.isEmpty) {
      return "Phone can't be blank!";
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validatingNameField(String? value) {
    if (value == null || value.isEmpty) {
      return "Name can't be blank!";
    } else if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    return null;
  }

  static String? validatingConfirmPasswordField({
    String? password,
    String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password can't be blank!";
    } else if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}
