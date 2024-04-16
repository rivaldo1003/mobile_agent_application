import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountAndSecurity extends StatefulWidget {
  @override
  State<AccountAndSecurity> createState() => _AccountAndSecurityState();
}

class _AccountAndSecurityState extends State<AccountAndSecurity> {
  bool isON = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey900,
      appBar: AppBar(
        centerTitle: true,
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
          'Account and Security',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            // height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // color: Colors.grey,
                // border: Border(
                //   bottom: BorderSide(color: Colors.grey),
                // ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                SvgPicture.asset(
                  'assets/icons/chevron_right.svg',
                  color: darkGrey400,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            // color: Colors.grey,
            // height: 84,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biometric Feature',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Seamless log in with fingerprint or face \nrecognition',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: darkGrey200,
                      ),
                    ),
                  ],
                ),
                CupertinoSwitch(
                  value: isON,
                  activeColor: Colors.green,
                  onChanged: (newValue) {
                    setState(
                      () {
                        isON = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 24,
            color: darkGrey800,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            // height: 64,
            decoration: BoxDecoration(),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delete Account',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: redColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Thiss will permanently delete your account',
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
        ],
      ),
    );
  }
}
