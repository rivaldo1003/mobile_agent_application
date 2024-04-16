import 'package:elderselettricomobile/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/values/colors.dart';
import 'error_view.dart';

class FailedGetData extends StatelessWidget {
  const FailedGetData({this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGrey900,
      padding: EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SvgPicture.asset('assets/icons/handle.svg'),
          ),
          SizedBox(height: 8),
          ErrorView(
            title: 'Failed to get data',
            messageList: [
              AppStrings.failedGetDataTitle,
              AppStrings.failedGetDataMessage,
            ],
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
