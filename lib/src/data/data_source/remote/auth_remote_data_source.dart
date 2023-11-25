import 'package:base_auth_app/src/core/_core.dart';
import 'package:base_auth_app/src/data/models/user_model.dart';
import 'package:base_auth_app/src/domain/data_source/auth_data_source.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final _api = Api();

  @override
  Future<void> login(String email, String password) async {
    try {
      final Response res = await _api.post('auth/login', {
        'nombreUsuario': email,
        'password': password,
      });
      final UserModel user = UserModel.fromJson(res.data['usuario']);
      final String token = res.data['token'];
      await setValue('token', token);
      await setValue('user', user.toJson().toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await removeValue('token');
      await removeValue('user');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register(String userName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
