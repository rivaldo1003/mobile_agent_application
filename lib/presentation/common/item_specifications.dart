import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSpecifications extends StatelessWidget {
  final String image;
  final String titleItem;
  final valueItem;
  final String format;
  final Color? iconColor;
  final bool isDisabled;

  ItemSpecifications({
    required this.image,
    required this.titleItem,
    required this.valueItem,
    required this.format,
    this.iconColor,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 8,
          top: 8,
          bottom: 8,
          right: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image.contains('.svg')
                ? SvgPicture.asset(
                    image,
                    height: 40,
                    width: 40,
                  )
                : image.isEmpty
                    ? Container()
                    : Image.asset(
                        image,
                        height: 40,
                        width: 40,
                      ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    valueItem.toString(),
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.5),
                  child: Text(
                    format,
                    style: TextStyle(
                      color: darkGrey50,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              titleItem,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: darkGrey200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
