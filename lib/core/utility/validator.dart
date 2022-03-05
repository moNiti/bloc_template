class Validator {
  static ValidatedModel isRequired(String? value) =>
      ValidatedModel(isValid: value == null, errorMessage: "กรุณากรอกข้อมูล");

  static ValidatedModel isEmailValid(String? email) {
    if (email == null || email.isEmpty) return isRequired(email);

    bool isCorrect = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return ValidatedModel(
      isValid: isCorrect,
      errorMessage: "email ไม่ถูกต้อง",
    );
  }

  static ValidatedModel isPasswordValid(String? password) {
    if (password == null || password.isEmpty) return isRequired(password);
    return ValidatedModel(
      isValid: password.length > 3,
      errorMessage: "กรุณาระบุรหัสผ่านมากกว่า 3 ตัว",
    );
  }
}

class ValidatedModel {
  final bool isValid;
  String? errorMessage;
  ValidatedModel({
    required this.isValid,
    this.errorMessage,
  }) {
    if (isValid) errorMessage = null;
  }

  ValidatedModel copyWith({
    bool? isValid,
    String? errorMessage,
  }) {
    return ValidatedModel(
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
