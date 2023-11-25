/// Interface for auth data source
///
/// This interface is used to abstract the auth data source
abstract class IAuthDataSource {
  /// [login] is a method that is used to login a user
  ///
  /// [userName] is [String] type and is the userName of the user
  /// [password] is [String] type and is the password of the user
  Future<void> login(String userName, String password);

  /// [register] is a method that is used to register a user
  ///
  /// [userName] is [String] type and is the name of the user
  /// [email] is [String] type and is the email of the user
  ///  [password] is [String] type and is the password of the user
  Future<void> register(String userName, String email, String password);

  /// [logout] is a method that is used to logout a user
  Future<void> logout();
}
