import 'package:base_auth_app/src/data/inputs/_inputs.dart';
import 'package:base_auth_app/src/presentation/providers/_providers.dart';
import 'package:base_auth_app/src/presentation/screens/_screens.dart';
import 'package:base_auth_app/src/presentation/views/login_view.dart';
import 'package:base_auth_app/src/presentation/views/register_view.dart';
import 'package:base_auth_app/src/presentation/widgets/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerStatefulWidget {
  static String get routeName => '/auth';
  const AuthScreen({
    super.key,
  });

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends ConsumerState<AuthScreen> {
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();

  EmailInput emailInput = const EmailInput.pure();
  UserNameInput userNameInput = const UserNameInput.pure();
  PasswordInput passwordInput = const PasswordInput.pure();
  PasswordInput confirmPasswordInput = const PasswordInput.pure();

  handleAuth() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (isLogin) {
        ref.read(authProvider.notifier).login(
              userNameInput.value,
              passwordInput.value,
            );
      } else {
        try {
          ref.read(authProvider.notifier).register(
                userNameInput.value,
                emailInput.value,
                passwordInput.value,
              );
          setState(() => isLogin = !isLogin);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuario registrado correctamente'),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      }
    }
  }

  @override
  void initState() {
    ref.read(authProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AsyncData<bool>) {
        if (next.value) context.go(HomeScreen.routeName);
      }
    });

    debugPrint(auth.toString());
    if (auth is AsyncLoading) return const CircularProgressIndicator();

    if (auth is AsyncData) {}

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
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
                      userNameChange: (value) => setState(
                          () => userNameInput = UserNameInput.dirty(value)),
                      passwordChange: (value) => setState(
                          () => passwordInput = PasswordInput.dirty(value)),
                      userNameValidator: (_) {
                        if (userNameInput.error == null) return null;
                        return userNameInput.getErrorString();
                      },
                      passwordValidator: (_) {
                        if (passwordInput.error == null) return null;
                        return passwordInput.getErrorString();
                      },
                    )
                  else
                    RegisterView(
                      userNameChange: (value) => setState(
                          () => userNameInput = UserNameInput.dirty(value)),
                      emailChange: (value) =>
                          setState(() => emailInput = EmailInput.dirty(value)),
                      passwordChange: (value) => setState(
                          () => passwordInput = PasswordInput.dirty(value)),
                      confirmPasswordChange: (value) => setState(() =>
                          confirmPasswordInput = PasswordInput.dirty(value)),
                      userNameValidator: (_) {
                        if (userNameInput.error == null) return null;
                        return userNameInput.getErrorString();
                      },
                      emailValidator: (_) {
                        if (emailInput.error == null) return null;
                        return emailInput.getErrorString();
                      },
                      passwordValidator: (_) {
                        if (passwordInput.error == null) return null;
                        return passwordInput.getErrorString();
                      },
                      confirmPasswordValidator: (_) {
                        if (confirmPasswordInput.error == null) return null;
                        if (passwordInput.value != confirmPasswordInput.value) {
                          return 'Las contraseñas no coinciden';
                        }
                        return confirmPasswordInput.getErrorString();
                      },
                    ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: AppButtonWidget(
                      onPressed: () => handleAuth(),
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
      ),
    );
  }
}
