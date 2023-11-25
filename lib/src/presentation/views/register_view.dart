import 'package:base_auth_app/src/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final void Function(String) userNameChange;
  final void Function(String) emailChange;
  final void Function(String) passwordChange;
  final void Function(String) confirmPasswordChange;
  final String? Function(String?) userNameValidator;
  final String? Function(String?) emailValidator;
  final String? Function(String?) passwordValidator;
  final String? Function(String?) confirmPasswordValidator;
  const RegisterView({
    super.key,
    required this.userNameChange,
    required this.emailChange,
    required this.passwordChange,
    required this.confirmPasswordChange,
    required this.userNameValidator,
    required this.emailValidator,
    required this.passwordValidator,
    required this.confirmPasswordValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          labelText: 'Name',
          onChanged: userNameChange,
          validator: userNameValidator,
        ),
        const SizedBox(height: 10),
        AppTextFormField(
          keyboardType: TextInputType.emailAddress,
          labelText: 'Email',
          onChanged: emailChange,
          validator: emailValidator,
        ),
        const SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Password',
          isPassword: true,
          onChanged: passwordChange,
          validator: passwordValidator,
        ),
        const SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Confirm Password',
          isPassword: true,
          onChanged: confirmPasswordChange,
          validator: confirmPasswordValidator,
        ),
      ],
    );
  }
}
