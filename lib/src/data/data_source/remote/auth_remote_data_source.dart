import 'package:base_auth_app/src/core/_core.dart';
import 'package:base_auth_app/src/domain/data_source/auth_data_source.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final _api = Api();

  @override
  Future<String> login(String email, String password) async {
    try {
      final Response res = await _api.post('login', {
        'email': email,
        'password': password,
      });
      final data = res.data as Map<String, dynamic>;
      print(data);
      return data['token'] as String;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<String> register(String userName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
