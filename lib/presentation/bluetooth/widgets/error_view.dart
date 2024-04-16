import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart';

import '../../common/text_style.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.title,
    required this.messageList,
    this.buttonText,
    this.onTap,
    this.isLoading = false,
  });

  final String title;
  final List<String> messageList;
  final String? buttonText;
  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/change_config_illustration.svg'),
          SizedBox(height: 40),
          Text(
            title,
            style: AppTextStyle.title2,
          ),
          SizedBox(height: 16),
          Column(
            children: _buildMessageTile(),
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
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : Text(
                          buttonText ?? 'Retry',
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
    );
  }

  List<Widget> _buildMessageTile() {
    return messageList
        .mapIndexed((index, message) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ',
                      style: AppTextStyle.title5,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        message,
                        style: AppTextStyle.title5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ))
        .toList();
  }
}
