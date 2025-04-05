import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

getInputStyle({
  String? hint,
  bool ispassword = false,
  bool showPassword = false,
  Function()? suffixtap,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: getBodyTextStyle(color: Colors.grey),
    fillColor: AppColours.dividerColor,
    filled: true,
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
      borderSide: const BorderSide(color: AppColours.primaryColor, width: 1),
    ),
    suffixIcon:
        ispassword
            ? IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                suffixtap!();
              },
            )
            : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF8391A1), width: 1),
    ),
  );
}
