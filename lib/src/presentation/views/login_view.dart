import 'package:base_auth_app/src/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppTextFormField(
          labelText: 'Email',
        ),
        SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Password',
          isPassword: true,
        ),
      ],
    );
  }
}
