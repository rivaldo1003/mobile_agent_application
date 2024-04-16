import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_banner.dart';

class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  BannerItem({
    required this.appBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 165,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                appBanner.img,
              ),
            ),
          ),
        ),
        SizedBox(height: 48),
        Text(
          '${appBanner.title}',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${appBanner.description}',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
