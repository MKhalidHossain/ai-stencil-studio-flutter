import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class NotificationActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? iconColor;

  const NotificationActionButton({
    super.key,
    required this.onPressed,
    this.size = 20.0,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(9),
        child: Icon(
          Icons.notifications_none_outlined,
          color: AppColors.white,
          size: 20,
        ),
      ),
    );
  }
}
