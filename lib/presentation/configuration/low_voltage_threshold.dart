import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';

class LowVoltageThreshold extends StatefulWidget {
  final int id;
  final double lowVoltageThreshold;

  LowVoltageThreshold({required this.id, required this.lowVoltageThreshold});

  @override
  State<LowVoltageThreshold> createState() => _LowVoltageThresholdState();
}

class _LowVoltageThresholdState extends State<LowVoltageThreshold> {
  bool isON = false;
  late double lowVoltageThresholdItem;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('low_vlotage_threshold_on', isON);
  }

  Future<bool> getON() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('low_vlotage_threshold_on') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getON().then((value) {
      isON = value;
      setState(() {});
    });
    lowVoltageThresholdItem = widget.lowVoltageThreshold;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Low Voltage Threshold',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              lowVoltageThresholdItem = 40;
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
              label: 'Low Voltage Threshold',
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
              value: lowVoltageThresholdItem,
              min: 40,
              max: 120,
              unit: "%",
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? lowVoltageThresholdItem = value : null;
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
              saveData();
              var dataSliderlowVoltageThreshold =
                  lowVoltageThresholdItem.toInt();
              Navigator.pop(context, dataSliderlowVoltageThreshold);
            },
          ),
        ),
      ),
    );
  }
}
