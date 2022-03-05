import 'package:bloc_template/core/router/app_path.dart';
import 'package:bloc_template/features/auth/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          // DO NAVIGATE

          debugPrint('SUCCESS =>>> NAVIGATE');

          context.goNamed(AppPath.home.name);
        }
        if (state.status.isError) {
          // DO SHOW ERROR DIALOG
          debugPrint('ERROR =>>> DIALOG');
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Column(
              children: [
                Text("LOGIN"),
                TextField(
                  onChanged: context.read<LoginCubit>().onEmailChange,
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorText: state.form.email.errorMessage,
                    enabled: !state.status.isLoading,
                  ),
                ),
                TextField(
                  onChanged: context.read<LoginCubit>().onPasswordChange,
                  decoration: InputDecoration(
                    hintText: "Password",
                    errorText: state.form.password.errorMessage,
                    enabled: !state.status.isLoading,
                  ),
                ),
              ],
            ),
            AbsorbPointer(
              absorbing: !state.form.isValid || state.status.isLoading,
              child: ElevatedButton(
                onPressed: context.read<LoginCubit>().onLogin,
                child: !state.form.isValid
                    ? Text("กรอกให้ถูกก่อนจ้า")
                    : state.status.isLoading
                        ? Text("กำลังโหลดจ้า อย่าซนนะ")
                        : Text("LOGIN"),
              ),
            ),
          ],
        );
      },
    );
  }
}
