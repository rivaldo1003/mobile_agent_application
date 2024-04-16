import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';

class SwitchForm extends StatelessWidget {
  const SwitchForm({required this.value, required this.label, this.onChanged});

  final bool value;
  final String label;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        CupertinoSwitch(
          value: value,
          activeColor: greenColor,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
