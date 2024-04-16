import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Flavor {
  PROD,
  DEV,
}

class FlavorConfig {
  static Flavor? appFlavor;

  static Widget dataLogSwitch(bool value, void Function(bool)? onChanged) {
    return FlavorConfig.appFlavor == Flavor.DEV ? Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Write Log',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: value,
            activeColor: greenColor,
            inactiveTrackColor: darkGrey600,
            onChanged: onChanged,
          ),
        ],
      ),
    ) : Container();
  }

}
