import 'package:base_auth_app/src/domain/data_source/auth_data_source.dart';
import 'package:base_auth_app/src/domain/repository/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDataSource _ds;

  AuthRepository(this._ds);

  @override
  Future<void> login(String userName, String password) =>
      _ds.login(userName, password);

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(String userName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
