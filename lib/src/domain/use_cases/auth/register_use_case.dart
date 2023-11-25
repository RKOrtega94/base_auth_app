abstract class IRegisterUseCase {
  Future<void> call(
    String name,
    String email,
    String password,
  );
}
