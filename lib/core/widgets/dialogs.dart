import 'package:bookia/core/utils/appcolour.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showErrorToast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColours.redColor,
      content: Row(
        children: [
          const Icon(Icons.error, color: AppColours.backgroundColor),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    ),
  );
}

showSuccessToast(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: AppColours.greenColor, content: Text(text)),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset("assets/images/loading.json", width: 200)],
        ),
  );
}

showNormalLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(color: AppColours.primaryColor)],
        ),
  );
}
