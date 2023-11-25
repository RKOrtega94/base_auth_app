/// Login use case interface

abstract class ILoginUseCase {
  Future<void> call(String email, String password);
}
