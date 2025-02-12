import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomEVB extends StatelessWidget {
  const CustomEVB({
    super.key,
    required this.onTap,
    required this.widget,
  });

  final void Function()? onTap;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: widget);
  }
}
