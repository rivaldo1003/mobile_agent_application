import 'package:elderselettricomobile/domain/model/battery.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/icons.dart';

class BatteryInformation extends StatefulWidget {
  final double? dataSpeedster;
  final double? dataDuro;
  final double? estRangeSpeedster;
  final double? estRangeDuro;

  BatteryInformation({
    required this.dataSpeedster,
    required this.dataDuro,
    required this.estRangeSpeedster,
    required this.estRangeDuro,
  });

  @override
  State<BatteryInformation> createState() => _BatteryInformationState();
}

class _BatteryInformationState extends State<BatteryInformation> {
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
          'Battery Management',
          style: AppTextStyle.title2,
        ),
      ),
      body: Column(
        children: [
          BatteryCard(
            batteryType: BatteryType.speedster,
            description:
                'For the speed and distance rider who likes to enjoy the ride.',
            batteryValue: _getBatteryPercentage(widget.dataSpeedster),
            estRangeValue: widget.estRangeSpeedster == null
                ? '--'
                : '${(widget.estRangeSpeedster! < 0) ? 0 : widget.estRangeSpeedster!.toInt()}',
          ),
          BatteryCard(
            batteryType: BatteryType.duro,
            description: 'For the relaxed rider who likes to enjoy the ride.',
            batteryValue: _getBatteryPercentage(widget.dataDuro),
            estRangeValue: widget.estRangeDuro == null
                ? '--'
                : '${(widget.estRangeDuro! < 0) ? 0 : widget.estRangeDuro!.toInt()}',
          ),
        ],
      ),
    );
  }

  String _getBatteryPercentage(double? value) {
    return value == null
        ? '--'
        : value < 0
            ? 0.toString()
            : value > 100
                ? 100.toString()
                : '${value.toInt()}';
  }
}

class BatteryCard extends StatelessWidget {
  BatteryCard({
    required this.batteryType,
    required this.description,
    required this.batteryValue,
    required this.estRangeValue,
  });

  final BatteryType batteryType;
  final String description;
  final String batteryValue;
  final String estRangeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Material(
        color: darkGrey800,
        borderRadius: BorderRadius.circular(13),
        child: InkWell(
          borderRadius: BorderRadius.circular(13),
          onTap: () async {
            Navigator.pop(context, batteryType);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/battery_voltage.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            batteryType.text,
                            style: GoogleFonts.montserrat(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: AppIcons.svg(
                              'chevron_right',
                              color: darkGrey200,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          description,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: darkGrey200,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(color: darkGrey600),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/battery_horizontal.svg',
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    batteryValue,
                                    style: AppTextStyle.title4,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '%',
                                    style: AppTextStyle.title4,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/map_range.svg',
                                ),
                                SizedBox(width: 4),
                                Text(
                                  estRangeValue,
                                  style: AppTextStyle.title4,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'km',
                                  style: AppTextStyle.title4,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
