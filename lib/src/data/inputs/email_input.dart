import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, validEmail }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) return EmailInputError.validEmail;

    return value.isEmpty ? EmailInputError.empty : null;
  }

  String? getErrorString() {
    if (error == EmailInputError.empty) return 'Email is required';
    return null;
  }
}
