import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/values/icons.dart';
import '../../common/text_style.dart';

class SettingAppBar extends AppBar {
  SettingAppBar(
      {required String title,
      required void Function() onBackPressed,
      void Function()? onReset})
      : super(
            centerTitle: true,
            toolbarHeight: 66,
            elevation: 0,
            title: Text(
              title,
              style: AppTextStyle.title2,
            ),
            leadingWidth: 56,
            leading: GestureDetector(
              onTap: onBackPressed,
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: SvgPicture.asset('assets/icons/button_back.svg'),
              ),
            ),
            actions: onReset != null
                ? [
                    GestureDetector(
                      onTap: onReset,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: Row(
                          children: [
                            Text(
                              'Reset',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]
                : []);
}
