import 'package:elderselettricomobile/domain/model/config.dart';
import 'package:elderselettricomobile/presentation/config_mode/add_config_mode.dart';
import 'package:flutter/material.dart';

import '../../core/values/colors.dart';
import '../common/text_style.dart';

class ConfigModeTile extends StatelessWidget {
  ConfigModeTile({required this.config});

  final ConfigMode config;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return AddConfigMode(configMode: config);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 12),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: darkGrey800,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
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
                  config.name,
                  style: AppTextStyle.title4,
                ),
                SizedBox(height: 4),
                Text(
                  config.description ?? '',
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
