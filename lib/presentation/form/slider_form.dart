import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';

class SliderForm extends StatelessWidget {
  const SliderForm({
    required this.value,
    required this.min,
    required this.max,
    required this.isEnabled,
    this.unit = 'kmh',
    this.onChanged,
  });

  final double value;
  final double min;
  final double max;
  final bool isEnabled;
  final String? unit;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: (isEnabled == true) ? greenColor : darkGrey500,
              inactiveTrackColor: darkGrey700,
              // trackShape: RectangularSliderTrackShape(),
              trackHeight: 8.0,
              thumbColor: Colors.white,
              thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 14.0, elevation: 4),
              overlayColor: Color(0xffA69875).withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
            ),
            child: Slider(
              min: min,
              max: max,
              divisions: 100,
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            '${value.toInt()}${unit != null ? ' ${unit}' : ''}',
            style: GoogleFonts.montserrat(
              color: darkGrey200,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
