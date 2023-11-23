import 'package:base_auth_app/src/core/_core.dart';
import 'package:base_auth_app/src/data/use_cases/auth/login_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  Stream<String> build() async* {
    yield await getValue('token');
  }

  // Login
  Future<void> login(String email, String password) async {
    await LoginUseCase().call(email, password);
  }

  // Register
  Future<void> register(String email, String password) async {}

  // Logout
  Future<void> logout() async {}
}
