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
    return Column(
      children: [
        AppTextFormField(
          labelText: 'Email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        const AppTextFormField(
          labelText: 'Password',
          isPassword: true,
        ),
      ],
    );
  }
}
