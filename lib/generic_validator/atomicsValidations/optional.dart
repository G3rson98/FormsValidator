
import 'package:forms_validatio/generic_validator/validator.util.dart';

class Optional extends InputValidator {
  const Optional();

  @override
  bool isValid(String? value) {
    return true;
  }
}