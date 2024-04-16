import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppBarWidget {
  static final appBarWidget = AppBar(
    leadingWidth: 56,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        child: SvgPicture.asset('assets/icons/button_back.svg'),
      ),
    ),
    elevation: 0.5,
    backgroundColor: darkGrey900,
    title: Text(
      'Personal Information',
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );
}
