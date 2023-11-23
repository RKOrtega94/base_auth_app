import 'package:base_auth_app/src/presentation/views/login_view.dart';
import 'package:base_auth_app/src/presentation/views/register_view.dart';
import 'package:base_auth_app/src/presentation/widgets/shared/button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static String get routeName => '/auth';
  final bool isLogin;
  const AuthScreen({super.key, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  isLogin ? 'Login' : 'Register',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (isLogin) const LoginView() else const RegisterView(),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: AppButtonWidget(
                    label: isLogin ? 'Login' : 'Register',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
