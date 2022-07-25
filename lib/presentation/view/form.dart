import 'package:flutter/material.dart';
import 'package:forms_validatio/presentation/form_validator/user_validator.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  late final List<TextEditingController> _controllers;
  late final UserValidator _validator;
  @override
  void initState() {
    _controllers = List.generate(3, (index) => TextEditingController());
    _validator = UserValidator(controllers: _controllers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
        children: [
          StreamBuilder<String>(
            key: UniqueKey(),
            stream: _validator.stream(0),
            builder: (context, snap) {
              return Focus(
                child: TextFormField(
                  controller: _controllers[0],
                  decoration: InputDecoration(
                    labelText: 'nombre',
                    errorText: snap.hasError ? snap.error.toString() : null,
                  ),
                ),
                onFocusChange: (bool focused) =>
                    !focused ? _validator.valid(0) : null,
              );
            },
          ),

          //!this button is enabled when all inputs contains valid values
          StreamBuilder(
            stream: _validator.buttonValid(),
            builder: (context, snap) {
              return ElevatedButton(
                onPressed: snap.data != true ? null : () {},
                child: const Text('submit'),
              );
            },
          )
        ],
      )),
    );
  }
}
