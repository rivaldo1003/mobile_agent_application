import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/values/colors.dart';

class MapMainBottomSheet extends StatelessWidget {
  const MapMainBottomSheet({required this.onSearch});

  final Function()? onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        top: 8,
        right: 16,
        bottom: 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
        color: surfaceColor,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/handle.svg'),
          SizedBox(height: 24),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Where are you heading?',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'Choose your destination',
                  style: GoogleFonts.montserrat(
                    color: darkGrey100,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: onSearch,
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkGrey800,
                      border: Border.all(color: darkGrey900),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/search.svg'),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Search destination',
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: darkGrey100),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
