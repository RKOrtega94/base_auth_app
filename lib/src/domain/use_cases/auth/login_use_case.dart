/// Login use case interface

abstract class ILoginUseCase {
  Future<String> call(String email, String password);
}
