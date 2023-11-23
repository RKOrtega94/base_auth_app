import 'package:base_auth_app/src/domain/data_source/auth_data_source.dart';
import 'package:base_auth_app/src/domain/repository/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDataSource _ds;

  AuthRepository(this._ds);

  @override
  Future<String> login(String email, String password) =>
      _ds.login(email, password);

  @override
  Future<void> logout() => _ds.logout();

  @override
  Future<String> register(String userName, String email, String password) =>
      _ds.register(userName, email, password);
}
