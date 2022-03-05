import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: Key("SIGNUPFORM"),
        child: Column(
          children: [
            Text("SignUp"),
            TextFormField(),
            TextFormField(),
          ],
        ));
  }
}
