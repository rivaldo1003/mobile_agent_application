import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNotifications extends StatefulWidget {
  @override
  State<AppNotifications> createState() => _AppNotificationsState();
}

class _AppNotificationsState extends State<AppNotifications> {
  bool isONNotif = false;
  bool isONEmail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey900,
      appBar: AppBar(
        backgroundColor: darkGrey900,
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
        elevation: 0,
        title: Text(
          'App Notifications',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Used to received system notification \nmessages.',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: darkGrey200,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/icons/chevron_right.svg',
                  color: darkGrey400,
                )
              ],
            ),
          ),
          Container(
            height: 24,
            color: darkGrey800,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Push Notifications',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                CupertinoSwitch(
                    value: isONNotif,
                    onChanged: (value) {
                      setState(() {
                        isONNotif = value;
                      });
                    })
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: darkGrey600, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email Address',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                CupertinoSwitch(
                    value: isONEmail,
                    onChanged: (value) {
                      setState(() {
                        isONEmail = value;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
