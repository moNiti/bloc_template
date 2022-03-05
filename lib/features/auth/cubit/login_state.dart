part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({required this.form, required this.status});
  final LoginForm form;
  final LoginStatus status;

  @override
  List<Object> get props => [status, form];

  LoginState copyWith({
    LoginForm? form,
    LoginStatus? status,
  }) {
    return LoginState(
      form: form ?? this.form,
      status: status ?? this.status,
    );
  }
}

enum LoginStatus { initial, success, error, loading }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isSuccess => this == LoginStatus.success;
  bool get isError => this == LoginStatus.error;
  bool get isLoading => this == LoginStatus.loading;
}
