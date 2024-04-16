import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';

class AlertInfo extends StatelessWidget {
  const AlertInfo({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 16),
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 8),
      decoration: BoxDecoration(
        color: blueColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: blueColor,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/info_circle.svg',
            height: 20,
            width: 20,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              style: GoogleFonts.montserrat(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
