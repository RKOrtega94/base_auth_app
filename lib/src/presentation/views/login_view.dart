import 'package:base_auth_app/src/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final Function(String email, String password) onLogin;
  const LoginView({
    super.key,
    required this.onLogin,
  });

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
