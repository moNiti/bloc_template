import 'package:bloc_template/features/auth/cubit/form_type_cubit.dart';
import 'package:bloc_template/features/auth/cubit/login_cubit.dart';
import 'package:bloc_template/features/auth/widget/auth_switcher.dart';
import 'package:bloc_template/features/auth/widget/controller_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FormTypeCubit()),
        BlocProvider(create: (_) => LoginCubit()),
      ],
      child: const AuthLayout(),
    );
  }
}

class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: const [
                ControllerButtons(),
                AuthSwitcher(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
