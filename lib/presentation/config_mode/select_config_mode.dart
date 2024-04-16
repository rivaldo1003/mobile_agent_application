import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class SelectConfigMode extends StatelessWidget {
  const SelectConfigMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkGrey900,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Config mode',
                style: AppTextStyle.title2,
              )
            ],
          )
        ],
      ),
    );
  }
}
