import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final Function validatorFunction;
  final TextEditingController textEditingController;
  final bool isPassword;
  final bool isDisabled;
  final bool isReadOnly;
  final suffix;
  final prefix;
  final onClick;

  void voidFunction() {}

  TextInput({
    required this.hintText,
    required this.labelText,
    required this.textInputType,
    required this.validatorFunction,
    required this.textEditingController,
    required this.isPassword,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.suffix,
    this.prefix,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: TextFormField(
        onTap: onClick,
        controller: textEditingController,
        validator: (value) {
          return validatorFunction(value);
        },
        keyboardType: textInputType,
        style: TextStyle(
          fontSize: 16.0,
        ),
        obscureText: isPassword,
        enabled: !isDisabled,
        readOnly: isReadOnly,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
          errorStyle: TextStyle(fontSize: 15.0),
          labelText: labelText,
          suffix: suffix,
          prefix: prefix,
          hintText: hintText,
        ),
      ),
    );
  }
}
