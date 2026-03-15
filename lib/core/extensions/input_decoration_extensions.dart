import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

extension InputDecorationExtensions on BuildContext {
  InputDecoration primaryInputDecoration({
    double borderRadius = 8.0,
    double contentPadding = 14.0,
  }) => InputDecoration(
    filled: true,
    suffixIconColor: AppColors.formIconColor,
    prefixIconColor: AppColors.formIconColor,
    contentPadding: EdgeInsets.all(contentPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.formBorderGray),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.formBorderGray),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.black, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.formBorderRed, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: AppColors.formBorderRed, width: 1.5),
    ),
    hintStyle: TextStyle(
      color: AppColors.hintText,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelStyle: TextStyle(
      color: AppColors.hintText,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    errorStyle: TextStyle(
      color: AppColors.formBorderRed,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
