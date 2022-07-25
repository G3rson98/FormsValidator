
import 'package:forms_validatio/generic_validator/validator.util.dart';

///# This Class is an Atomic Validation wich validate a String to not be Longer than X
///```dart
///NoLongerThan(x: 1 ,message: '#Example Rellená el campo vacío para registrarte.'),
///```
class NoLongerThan extends InputValidator {
  final int x;
  const NoLongerThan({message,required this.x}) : super(message: message);

  @override
  bool isValid(String? value) {
    return (value != null && value.length <= x);
  }
}