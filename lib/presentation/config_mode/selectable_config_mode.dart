import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/model/config.dart';
import '../../core/values/colors.dart';
import '../common/text_style.dart';

class SelectableConfigMode extends StatefulWidget {
  SelectableConfigMode({required this.config});

  final ConfigMode config;

  @override
  State<SelectableConfigMode> createState() => _SelectableConfigModeState();
}

class _SelectableConfigModeState extends State<SelectableConfigMode> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 12),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: darkGrey800,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: !selected
                  ? Icon(
                      Icons.circle_outlined,
                      color: darkGrey500,
                    )
                  : SvgPicture.asset('assets/icons/circle_success_blue.svg', height: 24, width: 24,),
            ),
            SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xffFF9F0A),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.config.name,
                  style: AppTextStyle.title4,
                ),
                SizedBox(height: 4),
                Text(
                  widget.config.description ?? '',
                  style: AppTextStyle.subtitle6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
