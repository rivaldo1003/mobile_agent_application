import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationCodeWidget extends StatefulWidget {
  @override
  State<VerificationCodeWidget> createState() => _VerificationCodeWidgetState();
}

class _VerificationCodeWidgetState extends State<VerificationCodeWidget> {
  String? code;
  bool onEditing = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerificationCode(
          textStyle: GoogleFonts.montserrat(
            color: Colors.white,
          ),
          keyboardType: TextInputType.number,
          length: 6,
          fillColor: darkGrey800,
          itemSize: MediaQuery.of(context).size.width / 9,
          underlineUnfocusedColor: darkGrey800,
          fullBorder: true,
          cursorColor: Colors.white,
          // clearAll: Padding(
          //   padding: const EdgeInsets.all(14),
          //   child: Text(
          //     'clear all',
          //     style: TextStyle(
          //         fontSize: 14.0,
          //         decoration: TextDecoration.underline,
          //         color: Colors.blue[700]),
          //   ),
          // ),
          margin: EdgeInsets.all(4),
          onCompleted: (String value) {
            setState(() {
              code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              onEditing = value;
            });
            if (!onEditing) FocusScope.of(context).unfocus();
          },
        ),
        SizedBox(height: 16),
        // Center(
        //   child: (onEditing != true)
        //       ? Text(
        //           'Your code: ${code}',
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         )
        //       : Text(
        //           'Please enter full code',
        //           style: TextStyle(
        //             color: darkGrey200,
        //           ),
        //         ),
        // ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
