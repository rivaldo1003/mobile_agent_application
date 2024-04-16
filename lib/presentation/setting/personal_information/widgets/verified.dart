import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifiedWidget extends StatelessWidget {
  String? status;
  VerifiedWidget({
    this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 100,
      decoration: BoxDecoration(
        color: darkGrey600,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/verified.svg'),
          SizedBox(width: 2),
          Text(
            status!,
            style: GoogleFonts.montserrat(
              color: darkGrey100,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
