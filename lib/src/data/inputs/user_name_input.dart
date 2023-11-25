import 'package:formz/formz.dart';

// Define input validation errors
enum UserNameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class UserNameInput extends FormzInput<String, UserNameInputError> {
  // Call super.pure to represent an unmodified form input.
  const UserNameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserNameInput.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UserNameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UserNameInputError.empty;
    if (value.length < 3) return UserNameInputError.length;
    return null;
  }

  String? getErrorString() {
    if (error == UserNameInputError.empty) {
      return 'El nombre de usuario no puede estar vacío';
    }
    if (error == UserNameInputError.length) {
      return 'El nombre de usuario debe tener al menos 3 caracteres';
    }
    return null;
  }
}
