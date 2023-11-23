/// Login use case interface

abstract class ILoginUseCase {
  Future<Map<String, String>> call(String email, String password);
}
