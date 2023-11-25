import 'package:base_auth_app/src/data/use_cases/auth/login_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Stream<bool> build() async* {
    checkAuth();
    String token = 'token';
    yield false;
  }

  // Login
  Future<void> login(String userName, String password) async {
    await LoginUseCase().call(userName, password);
  }

  // Register
  Future<void> register(String email, String password) async {}

  // Logout
  Future<void> logout() async {}

  // Check Auth
  Future<void> checkAuth() async {}
}
