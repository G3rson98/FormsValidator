import 'dart:async';
import 'package:flutter/material.dart';

import 'analizer.util.dart';

abstract class FormValidator {
  final List<Analizer> validations;
  final List<TextEditingController> controllers;
  late final List<StreamController<String>> streams;
  final _button = StreamController<bool>.broadcast()..add(false);

  FormValidator({required this.controllers, required this.validations}) {
    streams = [];
    controllers.forEach(
      (element) => streams.add(
        StreamController<String>.broadcast()..add(element.text),
      ),
    );
    _checkall();
  }

  Stream<String> stream(int index) => streams[index].stream;

  Stream<bool> buttonValid() => _button.stream;

  valid(int index) => validations[index].validate(controllers[index].text)
      ? streams[index].sink.add(controllers[index].text)
      : streams[index].sink.addError(validations[index].message!);

  _checkall() {
    var state = List<bool>.generate(controllers.length, (index) => false);
    for (var i = 0; i < controllers.length; i++) {
      controllers[i].addListener(() {
        state[i] = validations[i].validate(controllers[i].text);
        _button.add(_verifyState(state));
      });
    }
  }

  _verifyState(List<bool> state) {
    for (var i = 0; i < state.length; i++) {
      if (state[i] == false) return false;
    }
    return true;
  }

  submit();

  close() {
    _button.close();
    streams.forEach((element) => element.close());
    controllers.forEach((e) => e.dispose());
  }
}