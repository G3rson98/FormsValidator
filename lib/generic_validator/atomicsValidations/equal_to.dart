import 'package:flutter/cupertino.dart';
import 'package:forms_validatio/generic_validator/validator.util.dart';


class Equals extends InputValidator {
  final TextEditingController equal;
  const Equals({message, required this.equal}) : super(message: message);

  @override
  bool isValid(String? value) {
    return (value != null && value == equal.text);
  }
}