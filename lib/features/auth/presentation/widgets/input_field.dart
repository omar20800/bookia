// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/functions/validation.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint = '',
    this.keyboardType = TextInputType.text,
    required this.ispassword,
    required this.controller,
  });
  final bool ispassword;
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;

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
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColours.redColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColours.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColours.primaryColor,
            width: 1,
          ),
        ),
        suffixIcon:
            widget.ispassword
                ? IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
                : null,
        fillColor: AppColours.lightGrayColor,
        filled: true,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontFamily: 'DM Serif Display',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColours.grayColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF8391A1), width: 1),
        ),
      ),
    );
  }
}
