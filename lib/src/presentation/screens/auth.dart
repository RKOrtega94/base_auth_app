import 'package:base_auth_app/src/presentation/views/login_view.dart';
import 'package:base_auth_app/src/presentation/views/register_view.dart';
import 'package:base_auth_app/src/presentation/widgets/shared/button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static String get routeName => '/auth';
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
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
                if (isLogin)
                  LoginView(
                    onLogin: (email, password) {},
                  )
                else
                  const RegisterView(),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: AppButtonWidget(
                    label: isLogin ? 'Login' : 'Register',
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => setState(() => isLogin = !isLogin),
                  child: Text(
                    isLogin
                        ? 'Don\'t have an account? Register'
                        : 'Already have an account? Login',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
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
