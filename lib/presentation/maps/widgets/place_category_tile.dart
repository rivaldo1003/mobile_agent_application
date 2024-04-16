import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/model/place_category.dart';
import '../../../core/values/colors.dart';

class PlaceCategoryTile extends StatefulWidget {
  const PlaceCategoryTile(this.item, this.index);

  final PlaceCategory item;
  final int index;

  @override
  State<PlaceCategoryTile> createState() => _PlaceCategoryTileState();
}

class _PlaceCategoryTileState extends State<PlaceCategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 16, top: 6, bottom: 6),
      margin: EdgeInsets.only(
        left: widget.index == 0 ? 8 : 0,
        right: 8,
      ),
      decoration: BoxDecoration(
          color: darkGrey900,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: darkGrey800)),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(4),
            child: SvgPicture.asset('assets/icons/${widget.item.iconPath}'),
          ),
          SizedBox(width: 8),
          Text(
            widget.item.label,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
