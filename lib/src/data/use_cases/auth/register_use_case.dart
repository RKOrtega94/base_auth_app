import 'package:base_auth_app/src/data/data_source/remote/auth_remote_data_source.dart';
import 'package:base_auth_app/src/data/repository/auth_repository.dart';
import 'package:base_auth_app/src/domain/use_cases/auth/register_use_case.dart';

class RegisterUseCase implements IRegisterUseCase {
  final AuthRepository _repo = AuthRepository(
    AuthRemoteDataSource(),
  );

  @override
  Future call(String name, String email, String password) =>
      _repo.register(name, email, password);
}
