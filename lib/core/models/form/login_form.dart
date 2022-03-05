import 'package:bloc_template/core/models/form/field.dart';

class LoginForm {
  final Field<String> email;
  final Field<String> password;
  LoginForm({
    required this.email,
    required this.password,
  });

  LoginForm.empty() : this(email: Field(""), password: Field(""));

  bool get isValid => email.isValid && password.isValid;

  LoginForm copyWith({
    Field<String>? email,
    Field<String>? password,
  }) {
    return LoginForm(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email.value,
      'password': password.value,
    };
  }
}
