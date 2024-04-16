import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/text_style.dart';

class SegmentedControlForm extends StatelessWidget {
  const SegmentedControlForm({
    required this.label,
    required this.groupValue,
    required this.selections,
    required this.onChanged,
  });

  final dynamic groupValue;
  final String label;
  final Map<dynamic, String> selections;
  final void Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        CupertinoSlidingSegmentedControl(
          children: _buildSelections(),
          thumbColor: Color(0xffA69875),
          onValueChanged: onChanged,
          groupValue: groupValue,
        )
      ],
    );
  }

  Map<String, Widget> _buildSelections() {
    return selections.map((key, value) => MapEntry(
        key,
        Text(
          value,
          style: AppTextStyle.segmentedControlLabel,
        )));
  }
}
