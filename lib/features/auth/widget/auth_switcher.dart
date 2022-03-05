import 'package:bloc_template/features/auth/cubit/form_type_cubit.dart';
import 'package:bloc_template/features/auth/widget/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';

class AuthSwitcher extends StatelessWidget {
  const AuthSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormTypeCubit, FormTypeState>(
        bloc: context.read<FormTypeCubit>(),
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) => SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(2.5, 0), end: Offset.zero)
                      .animate(animation),
              child: child,
            ),
            child: state.formType == FormType.login
                ? const LoginForm()
                : const SignUpForm(),
          );
        });
  }
}
