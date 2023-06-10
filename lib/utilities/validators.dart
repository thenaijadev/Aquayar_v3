class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateText(String? value, String? label) {
    if (value == null || value.isEmpty) {
      return '$label cannot be empty';
    } else if (value.length < 3) {
      return "Your name is too short";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    } else if (!(value.length > 6 && value.length < 20)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String firstPassword) {
    if (value != null && value != firstPassword) {
      return "Password doesn't match!";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password == null) return 'Password cannot be empty';

    // Check for at least one uppercase letter
    final upperRegex = RegExp('[A-Z]');
    if (!upperRegex.hasMatch(password)) {
      return 'Your password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    final lowerRegex = RegExp('[a-z]');
    if (!lowerRegex.hasMatch(password)) {
      return 'Your password must contain at least one lowercase letter';
    }

    // Check for at least one special character
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!specialCharRegex.hasMatch(password)) {
      return 'Your password must contain a special character';
    }

    // Check length
    if (password.length < 8) {
      return 'Your password must be at least 8 characters';
    }
    return null;
  }
}
