import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class SpeedLimit extends StatefulWidget {
  final int id;
  final String speedLimit;
  final String isOn;

  SpeedLimit({
    required this.id,
    required this.speedLimit,
    required this.isOn,
  });

  @override
  State<SpeedLimit> createState() => _SpeedLimitState();
}

class _SpeedLimitState extends State<SpeedLimit> {
  bool isON = true;
  late double speedLimitItem;

  @override
  void initState() {
    super.initState();
    speedLimitItem = double.parse(widget.speedLimit);
    isON = widget.isOn == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Speed Limit',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = false;
              speedLimitItem = 60;
            });
          }),
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: SwitchForm(
              label: 'Speed Limit',
              value: isON,
              onChanged: (value) {
                setState(() {
                  isON = value;
                });
              },
            ),
          ),
          ConfigFormDescription(label: AppStrings.configSliderFormDescription),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 28, left: 8),
            child: SliderForm(
              value: speedLimitItem,
              min: 30,
              max: 100,
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? speedLimitItem = value : null;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 8 : 16),
          child: LargePrimaryButton(
            label: 'Save',
            onTap: () {
              var dataSliderspeedLimit = speedLimitItem.toInt();

              var dataTrue = 1;
              var dataFalse = 0;

              List<String> dataSpeedLimit2 = [
                dataSliderspeedLimit.toString(),
                (isON == true) ? dataTrue.toString() : dataFalse.toString(),
              ];

              Navigator.pop(context, dataSpeedLimit2);
            },
          ),
        ),
      ),
    );
  }
}
