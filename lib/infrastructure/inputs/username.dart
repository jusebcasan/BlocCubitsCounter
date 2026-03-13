import 'package:formz/formz.dart';

// Define input validation errors
enum UserNameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UserNameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (error == UserNameError.empty) return 'Campo Requerido';
    if (error == UserNameError.length) return 'Mas de 6 letras';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UserNameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return UserNameError.empty;
    }
    if (value.length < 6) {
      return UserNameError.length;
    }
    return null;
  }
}
