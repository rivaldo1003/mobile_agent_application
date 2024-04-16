import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

void showSuccessSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    titleText: Text(
      title,
      style: AppTextStyle.snackBarTitle,
    ),
    messageText: Text(
      message,
      style: AppTextStyle.subtitle4,
    ),
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 35,
    backgroundColor: darkGrey800,
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SvgPicture.asset('assets/icons/snackbar_success.svg'),
    ),
  );
}

void showErrorSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    titleText: Text(
      title,
      style: AppTextStyle.snackBarTitle,
    ),
    messageText: Text(
      message,
      style: AppTextStyle.subtitle4,
    ),
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 20),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 35,
    backgroundColor: redColor.withOpacity(0.8),
    icon: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SvgPicture.asset('assets/icons/snackbar_error.svg'),
    ),
  );
}
