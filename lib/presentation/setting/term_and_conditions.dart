import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TermAndConditions extends StatefulWidget {
  @override
  State<TermAndConditions> createState() => _TermAndConditionsState();
}

class _TermAndConditionsState extends State<TermAndConditions> {
  bool isON = false;

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
        centerTitle: true,
        title: Text(
          'Term and Conditions',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ELDERS ELETTRICO',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Terms and Conditions',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      'Welcome to Elders Elettrico Mobile Apps Mobile ! Please read on to learn the rules and restrictions that govern your use of our website(s), products, services and applications. If you have any questions, comments, or concerns regarding these terms or the services, please contact us at:',
                      style: GoogleFonts.montserrat(
                        color: darkGrey50,
                      ),
                    ),
                    // color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: elderselettrico@gmail.com',
                        style: GoogleFonts.montserrat(
                          color: darkGrey50,
                        ),
                      ),
                      Text(
                        'Address: JL. Gatot Subroto No. kav 94, Jakarta, ID 12780.',
                        style: GoogleFonts.montserrat(
                          color: darkGrey50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
