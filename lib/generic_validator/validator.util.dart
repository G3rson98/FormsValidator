///This is the base class for atomic validations
///
///all validations must `EXTENDS` this class
abstract class InputValidator {
  final String? message;
  const InputValidator({this.message});

  bool isValid(String? value);
}
