import 'package:bloc_template/features/auth/cubit/form_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControllerButtons extends StatelessWidget {
  const ControllerButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormTypeCubit, FormTypeState>(
      bloc: context.read<FormTypeCubit>(),
      builder: (context, state) {
        return Wrap(
          spacing: 10,
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: state.formType == FormType.login
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: () {
                  context.read<FormTypeCubit>().moveToLogin();
                },
                child: Text("Login")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: state.formType == FormType.signup
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: () {
                  context.read<FormTypeCubit>().moveToSignUp();
                },
                child: Text("Register")),
          ],
        );
      },
    );
  }
}
