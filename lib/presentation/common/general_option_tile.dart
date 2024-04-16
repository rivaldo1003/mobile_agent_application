import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/values/colors.dart';
import 'text_style.dart';

class GeneralOptionTile extends StatelessWidget {
  const GeneralOptionTile({
    required this.label,
    required this.iconPath,
    this.onTap,
  });

  final String label;
  final String iconPath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkGrey900,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                color: darkGrey100,
                height: 20,
                width: 20,
              ),
              SizedBox(width: 12),
              Text(
                label,
                style: AppTextStyle.title4,
              ),
              Spacer(),
              SvgPicture.asset('assets/icons/chevron_right.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
