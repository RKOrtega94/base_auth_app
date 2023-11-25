import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class PasswordInput extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;
    return null;
  }

  String? getErrorString() {
    if (error == PasswordInputError.empty) {
      return 'La contraseña no puede estar vacía';
    }
    if (error == PasswordInputError.length) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }
}
