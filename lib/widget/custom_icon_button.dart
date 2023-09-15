import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';

class IconSocal extends StatelessWidget {
  const IconSocal({super.key, required this.icon, required this.onTap});
final String icon;
    final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1.0, color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 18.h),
            child: Image.asset(
              icon,
              width: 24.w,
              height: 24.w,
            )),
      ),
    );
  }
}