class CustomValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validateUserName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Username is required';
    }

    if (name.length < 2) {
      return 'Username must be at least 2 characters';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }
}
