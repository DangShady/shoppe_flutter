import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:flutter/material.dart';

Future<dynamic> customDialog(BuildContext context,
    {Widget? icon,
      required String text,
      String? confirmText,
      bool? isLoading,
      Color textConfirmColor = Style.primaryColor,
      Function()? onConfirm}) {
  return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          // The background color
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null
                  ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 77, vertical: 40),
                  child: icon)
                  : const SizedBox(),
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color:  Style.primaryColor),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Please wait..."),
              const Text("You will be directed to the homepage"),
              const SizedBox(
                height: 32,
              ),
              if (isLoading == true) const CircularProgressIndicator(),
              const SizedBox(
                height: 32,
              ),
              // Some text
            ],
          ),
        );
      });
}
