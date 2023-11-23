import 'package:base_auth_app/src/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppTextFormField(
          labelText: 'Name',
        ),
        SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Email',
        ),
        SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Password',
          isPassword: true,
        ),
        SizedBox(height: 10),
        AppTextFormField(
          labelText: 'Confirm Password',
          isPassword: true,
        ),
      ],
    );
  }
}
