extension ExtString on String {
  bool get isValidEmail {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(this);
  }

  bool get isValidPassWord {
    final RegExp passwordRegex = RegExp(
        r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return passwordRegex.hasMatch(this);
  }

  bool get isValidName {
    final RegExp nameRegex = RegExp(r"^[A-Za-z][A-Za-z\s]{1,}[A-Za-z]$");
    return nameRegex.hasMatch(this);
  }
}
