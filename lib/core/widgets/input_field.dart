import 'package:bookia/core/functions/validation.dart';
import 'package:bookia/core/utils/input_style.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint = '',
    this.keyboardType = TextInputType.text,
    required this.ispassword,
    this.controller,
  });
  final bool ispassword;
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (widget.keyboardType == TextInputType.visiblePassword) {
          return passwordValid(value);
        } else if (widget.keyboardType == TextInputType.emailAddress) {
          return emailValid(value);
        } else if (widget.keyboardType == TextInputType.name) {
          return usernameValid(value);
        } else {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          return null;
        }
      },
      obscureText: widget.ispassword ? showPassword : false,
      keyboardType:
          widget.ispassword ? TextInputType.number : widget.keyboardType,
      decoration: getInputStyle(
        hint: widget.hint,
        ispassword: widget.ispassword,
        showPassword: showPassword,
        suffixtap: () => setState(() => showPassword = !showPassword),
      ),
    );
  }
}
