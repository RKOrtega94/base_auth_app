import 'package:base_auth_app/src/core/_core.dart';
import 'package:base_auth_app/src/data/use_cases/auth/login_use_case.dart';
import 'package:base_auth_app/src/data/use_cases/auth/register_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Stream<bool> build() async* {
    checkAuth();
    String token = await getValue('token');
    if (token.isNotEmpty) {
      yield true;
    } else {
      yield false;
    }
  }

  // Login
  Future<void> login(String userName, String password) async {
    await LoginUseCase().call(userName, password);
    state = const AsyncValue.data(true);
  }

  // Register
  Future<void> register(String name, String email, String password) async {
    await RegisterUseCase().call(name, email, password);
  }

  // Logout
  Future<void> logout() async {
    await removeValue('token');
    await removeValue('user');
    state = const AsyncValue.data(false);
  }

  // Check Auth
  Future<void> checkAuth() async {}
}
