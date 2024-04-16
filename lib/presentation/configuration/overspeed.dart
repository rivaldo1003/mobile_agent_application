import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class Overspeed extends StatefulWidget {
  final int id;
  final String overspeedSpeedRatio;
  final String overspeedLowSpeedRatio;
  final String isOn;

  Overspeed({
    required this.id,
    required this.overspeedSpeedRatio,
    required this.overspeedLowSpeedRatio,
    required this.isOn,
  });

  @override
  State<Overspeed> createState() => _OverspeedState();
}

class _OverspeedState extends State<Overspeed> {
  bool isON = false;
  late double overspeedSpeedRatioItemValue;
  late double overspeedLowSpeedRatioItemValue;

  @override
  void initState() {
    super.initState();
    overspeedSpeedRatioItemValue = double.parse(widget.overspeedSpeedRatio);
    overspeedLowSpeedRatioItemValue =
        double.parse(widget.overspeedLowSpeedRatio);
    isON = widget.isOn == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Overspeed',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              overspeedSpeedRatioItemValue = 10;
              overspeedLowSpeedRatioItemValue = 80;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: SwitchForm(
              label: 'Overspeed',
              value: isON,
              onChanged: (value) {
                setState(() {
                  isON = value;
                });
              },
            ),
          ),
          ConfigFormDescription(label: AppStrings.configSliderFormDescription),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  'Speed Ratio',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SliderForm(
                  value: overspeedSpeedRatioItemValue,
                  min: 5,
                  max: 10,
                  isEnabled: isON,
                  onChanged: (value) {
                    setState(() {
                      isON ? overspeedSpeedRatioItemValue = value : null;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  'Low Speed Ratio',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SliderForm(
                  value: overspeedLowSpeedRatioItemValue,
                  min: 10,
                  max: 80,
                  isEnabled: isON,
                  onChanged: (value) {
                    setState(() {
                      isON ? overspeedLowSpeedRatioItemValue = value : null;
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 8 : 16),
          child: LargePrimaryButton(
            label: 'Save',
            onTap: () {
              var dataoverspeedSpeedRatioItemValue =
                  overspeedSpeedRatioItemValue.toInt();
              var dataoverspeedLowSpeedRatioItemValue =
                  overspeedLowSpeedRatioItemValue.toInt();

              var dataTrue = 1;
              var dataFalse = 0;

              List<String> dataOverspeed = [
                dataoverspeedSpeedRatioItemValue.toString(),
                dataoverspeedLowSpeedRatioItemValue.toString(),
                (isON == true) ? dataTrue.toString() : dataFalse.toString(),
              ];

              Navigator.pop(context, dataOverspeed);
            },
          ),
        ),
      ),
    );
  }
}
