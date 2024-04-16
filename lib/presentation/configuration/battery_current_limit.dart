import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class BatteryCurrentLimit extends StatefulWidget {
  final int id;
  final double batteryCurrentLimit;

  BatteryCurrentLimit({required this.id, required this.batteryCurrentLimit});

  @override
  State<BatteryCurrentLimit> createState() => _BatteryCurrentLimitState();
}

class _BatteryCurrentLimitState extends State<BatteryCurrentLimit> {
  bool isON = false;
  late double batteryCurrentLimitItem;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('battery_current_limit_on', isON);
  }

  Future<bool> getON() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('battery_current_limit_on') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getON().then((value) {
      isON = value;
      setState(() {});
    });
    batteryCurrentLimitItem = widget.batteryCurrentLimit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Battery Current Limit',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              batteryCurrentLimitItem = 100;
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
              label: 'Battery Current Limit',
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
            child: Column(
              children: [
                SliderForm(
                  value: batteryCurrentLimitItem,
                  min: 50,
                  max: 100,
                  unit: "%",
                  isEnabled: isON,
                  onChanged: (value) {
                    setState(() {
                      isON ? batteryCurrentLimitItem = value : null;
                    });
                  },
                ),
              ],
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
              var dataSliderbatteryCurrentLimitItem =
                  batteryCurrentLimitItem.toInt();
              Navigator.pop(context, dataSliderbatteryCurrentLimitItem);
            },
          ),
        ),
      ),
    );
  }
}
