import 'package:base_auth_app/src/data/use_cases/auth/login_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Stream<bool> build() async* {
    checkAuth();
  }

  // Login
  Future<void> login(String email, String password) async {
    await LoginUseCase().call(email, password);
  }

  // Register
  Future<void> register(String email, String password) async {}

  // Logout
  Future<void> logout() async {}

  // Check Auth
  Future<void> checkAuth() async {}
}
