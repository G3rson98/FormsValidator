
import 'package:flutter/material.dart';
import 'package:forms_validatio/generic_validator/form_validator.util.dart';
import 'package:forms_validatio/generic_validator/generic_validator.dart';

class UserValidator extends FormValidator {
  UserValidator({
    required List<TextEditingController> controllers,
  }) : super(controllers: controllers, validations: [
      //this Analizer is for 1 input
      Analizer(validations: [
        //there are validations 
        const NotEmpty(message: 'no se permiten campos vacios'),
        //...N validations for 1 input
      ]),
      //.....
      // N inputs
  ]);

  @override
  submit() {
    // TODO: implement submit
    throw UnimplementedError();
  }
}
