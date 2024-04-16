import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/values/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: SvgPicture.asset('assets/icons/button_back.svg'),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Notifications',
          style: AppTextStyle.title2,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/empty_notification.svg'),
            SizedBox(height: 24),
            Text(
              'No notification',
              style: AppTextStyle.title4,
            ),
            SizedBox(height: 4),
            Text(
              'We will notify you if there is a new update',
              style: AppTextStyle.subtitle3,
            ),
          ],
        ),
      ),
    );
  }
}
