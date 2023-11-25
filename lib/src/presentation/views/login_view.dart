import 'package:base_auth_app/src/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final void Function(String) userNameChange;
  final void Function(String) passwordChange;
  final String? Function(String?) userNameValidator;
  final String? Function(String?) passwordValidator;
  const LoginView({
    super.key,
    required this.userNameChange,
    required this.passwordChange,
    required this.userNameValidator,
    required this.passwordValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          labelText: 'User name',
          onChanged: userNameChange,
          validator: userNameValidator,
        ),
        const SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Password',
          onChanged: passwordChange,
          isPassword: true,
          validator: passwordValidator,
        ),
      ],
    );
  }
}
