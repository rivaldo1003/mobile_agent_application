import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'primary_button.dart';
import '../../core/values/colors.dart';

void showSuccessModalBottomSheet(
  BuildContext context, {
  String? title,
  required String message,
  String? buttonLabel,
  String? imagePath,
  void Function()? onConfirm,
  void Function()? onCompleted,
}) {
  showRoundedBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: darkGrey900,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
            ),
          ),
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset('assets/icons/handle.svg'),
              ),
              SizedBox(height: 16),
              SvgPicture.asset(
                  imagePath ?? 'assets/images/success_illustration.svg'),
              SizedBox(height: 40),
              Text(
                title ?? 'Great!',
                style: AppTextStyle.title2,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  message,
                  style: AppTextStyle.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              LargePrimaryButton(
                label: buttonLabel ?? 'Got it',
                onTap: () {
                  onConfirm?.call();
                },
              ),
            ],
          ),
        );
      }).whenComplete(() => {onCompleted?.call()});
}

Future<T?> showRoundedBottomSheet<T>({
  required BuildContext context,
  bool isScrollControlled = false,
  bool useSafeArea = true,
  required Widget Function(BuildContext) builder,
}) {
  return showModalBottomSheet(
      context: context,
      useSafeArea: useSafeArea,
      isScrollControlled: isScrollControlled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      builder: builder);
}

Future<T?> showRoundedMaterialBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      builder: builder);
}

void showErrorModalBottomSheet(
  BuildContext context, {
  String? title,
  required String message,
  String? buttonLabel,
  String? imagePath,
  void Function()? onClose,
  void Function()? onCompleted,
}) {
  showRoundedBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: darkGrey900,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
            ),
          ),
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset('assets/icons/handle.svg'),
              ),
              imagePath != null
                  ? Column(
                      children: [
                        SizedBox(height: 16),
                        SvgPicture.asset(imagePath),
                      ],
                    )
                  : Container(),
              SizedBox(height: 40),
              Text(
                title ?? 'Error',
                style: AppTextStyle.title2,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.subtitle,
                ),
              ),
              SizedBox(height: 36),
              InkWell(
                onTap: () {
                  onClose?.call();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.close_rounded,
                        color: redColor,
                      ),
                      Text(
                        buttonLabel ?? 'Close',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: redColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).whenComplete(() => {onCompleted?.call()});
}

void showConfirmationBottomSheet(
  BuildContext context, {
  String? title,
  required String message,
  String? imagePath,
  String? buttonConfirmLabel,
  String? buttonCancelLabel,
  void Function()? onConfirm,
  void Function()? onCancel,
}) {
  showRoundedBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: darkGrey900,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
            ),
          ),
          padding: EdgeInsets.only(top: 8, bottom: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset('assets/icons/handle.svg'),
              ),
              SizedBox(height: 16),
              SvgPicture.asset(
                  imagePath ?? 'assets/images/change_config_illustration.svg'),
              SizedBox(height: 40),
              Text(
                title ?? 'Confirmation',
                style: AppTextStyle.title2,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  message,
                  style: AppTextStyle.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onCancel?.call();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                buttonCancelLabel ?? 'Cancel',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: darkGrey300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Material(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          onTap: () {
                            onConfirm?.call();
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              buttonConfirmLabel ?? 'Confirm',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

void showConfirmationAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
  void Function()? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: darkGrey900,
      title: Text(
        title,
        style: AppTextStyle.title2,
      ),
      content: Container(
        child: Text(
          message,
          style: AppTextStyle.title5,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: GoogleFonts.montserrat(
              color: darkGrey300,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'Confirm',
            style: AppTextStyle.brownLabel,
          ),
        ),
      ],
    ),
  );
}
