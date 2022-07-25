
import 'package:forms_validatio/generic_validator/validator.util.dart';

///# This Class is an Atomic Validation wich validate a String to not be Empty
///```dart
///NotEmpty(message: '#Example Rellená el campo vacío para registrarte.'),
///```
class NotEmpty extends InputValidator {
  const NotEmpty({message}) : super(message: message);

  @override
  bool isValid(String? value) {
    return (value != null && value.isNotEmpty);
  }
}