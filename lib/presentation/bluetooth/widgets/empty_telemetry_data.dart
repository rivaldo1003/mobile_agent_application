import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/values/colors.dart';
import '../../common/text_style.dart';

class EmptyTelemetryData extends StatelessWidget {
  const EmptyTelemetryData({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
        decoration: BoxDecoration(
          color: darkGrey900,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: darkGrey800,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/info_circle.svg'),
            SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyle.title3,
            ),
            SizedBox(height: 8),
            Text(
              message,
              style: AppTextStyle.subtitle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
