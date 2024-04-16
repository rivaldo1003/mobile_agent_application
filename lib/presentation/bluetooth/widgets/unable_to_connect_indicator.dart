import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/values/colors.dart';
import '../../common/text_style.dart';

class UnableToConnectIndicator extends StatelessWidget {
  const UnableToConnectIndicator({this.onTap, this.isLoading = false});

  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/change_config_illustration.svg'),
            SizedBox(height: 40),
            Text(
              'Unable to connect',
              style: AppTextStyle.title2,
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. ',
                  style: AppTextStyle.title5,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Check the vehicle's Bluetooth indicator, make sure it is turned on.",
                    style: AppTextStyle.title5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2.',
                  style: AppTextStyle.title5,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Keep the phone as close as possible to the device.',
                    style: AppTextStyle.title5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3.',
                  style: AppTextStyle.title5,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Check if the vehicle is still connected to another phone and disconnect it before attempting to connect again.',
                    style: AppTextStyle.title5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(24),
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(24),
                  splashColor: Colors.grey,
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : Text(
                            'Re-Connect',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
