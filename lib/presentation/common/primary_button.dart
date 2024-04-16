import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';

class LargePrimaryButton extends StatelessWidget {
  const LargePrimaryButton({
    required this.label,
    this.margin,
    this.onTap,
  });

  final String label;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(left: 16, right: 16),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              label,
              style: AppTextStyle.buttonLabel,
            ),
          ),
        ),
      ),
    );
  }
}
