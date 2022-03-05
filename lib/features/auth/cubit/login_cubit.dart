import 'package:bloc/bloc.dart';
import 'package:bloc_template/core/models/form/login_form.dart';
import 'package:bloc_template/core/utility/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(form: LoginForm.empty(), status: LoginStatus.initial));

  void onEmailChange(String? value) {
    debugPrint('ON EMAIL CHANGE $value');
    ValidatedModel validatedModel = Validator.isEmailValid(value);
    LoginForm newForm = state.form.copyWith();
    newForm.email.isValid = validatedModel.isValid;
    newForm.email.errorMessage = validatedModel.errorMessage;

    emit(state.copyWith(form: newForm));
  }

  void onPasswordChange(String value) {
    debugPrint('ON EMAIL CHANGE $value');
    ValidatedModel validatedModel = Validator.isPasswordValid(value);
    LoginForm newForm = state.form.copyWith();
    newForm.password.isValid = validatedModel.isValid;
    newForm.password.errorMessage = validatedModel.errorMessage;

    emit(state.copyWith(form: newForm));
  }

  Future<void> onLogin() async {
    debugPrint('LOGIN');
    emit(state.copyWith(status: LoginStatus.loading));
    await Future.delayed(const Duration(seconds: 4));
    emit(state.copyWith(status: LoginStatus.success));
  }
}
