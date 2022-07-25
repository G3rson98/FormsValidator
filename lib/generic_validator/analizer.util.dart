import 'atomicsValidations/not_empty.dart';
import 'atomicsValidations/optional.dart';
import 'validator.util.dart';

///This class contains a list with all validations for a single input
///* [validations] A list with validations
/// ```dart
/// List<InputValidator> validations
///```
/// ## Example for custom validations
/// ```dart
/// Analizer(validations: [
///     NotEmpty(message: '#Example Rellená el campo vacío para registrarte.'),
///     IsValidMail(message: '#Message to show if not valid'),
///     ],
/// )
///```
/// ## Example for defaul validations
/// ```dart
/// Analizer.notEmpty('#message to show if not valid')
///```
///
class Analizer {
  String? _invalidMessage;
  late final List<InputValidator> validations;

  Analizer({required this.validations});

  Analizer.notEmpty(String message) {
    validations = [NotEmpty(message: message)];
  }

  Analizer.optional() {
    validations = [const Optional()];
  }

  String? get message => _invalidMessage;

  bool validate(String? value) {
    for (InputValidator item in validations) {
      if (!item.isValid(value)) {
        _invalidMessage = item.message;
        return false;
      }
    }
    return true;
  }
}