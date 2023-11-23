import 'package:base_auth_app/src/data/data_source/remote/auth_remote_data_source.dart';
import 'package:base_auth_app/src/data/repository/auth_repository.dart';
import 'package:base_auth_app/src/domain/use_cases/auth/login_use_case.dart';

class LoginUseCase implements ILoginUseCase {
  final AuthRepository _repo = AuthRepository(
    AuthRemoteDataSource(),
  );
  @override
  Future<Map<String, String>> call(String email, String password) async {
    Map<String, String> res = {'res': '', 'error': ''};
    try {
      final token = await _repo.login(email, password);
      res['res'] = token;
    } catch (e) {
      res['error'] = e.toString();
    }
    return res;
  }
}
