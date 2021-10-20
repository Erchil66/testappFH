class ValidatorString {
  static String? email(String? email) {
    if (email!.isEmpty) {
      return 'Email Address Empty or Invalid';
    } else {
      return null;
    }
  }

  static String? passwordss(String? password) {
    if (password!.length < 3) {
      return 'Password to short or Empty';
    } else {
      return null;
    }
  }

  static String? dontLeavEmpty(String? text) {
    if (text!.isEmpty) {
      return "Please Don't leave it blank";
    } else {
      return null;
    }
  }
}
