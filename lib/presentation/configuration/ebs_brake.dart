import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';

class EbsBrake extends StatefulWidget {
  final int id;
  final double ebsBrake;

  EbsBrake({required this.id, required this.ebsBrake});

  @override
  State<EbsBrake> createState() => _EbsBrakeState();
}

class _EbsBrakeState extends State<EbsBrake> {
  bool isON = false;
  late double ebsBrakeItem;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('ebs_brake_on', isON);
  }

  Future<bool> getON() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('ebs_brake_on') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getON().then((value) {
      isON = value;
      setState(() {});
    });
    ebsBrakeItem = widget.ebsBrake;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'EBS Brake',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              ebsBrakeItem = 5;
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
              label: 'EBS Brake',
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
              value: ebsBrakeItem,
              min: 0,
              max: 7,
              unit: null,
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? ebsBrakeItem = value : null;
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
              var dataSliderebsBarakeItem = ebsBrakeItem.toInt();
              Navigator.pop(context, dataSliderebsBarakeItem);
            },
          ),
        ),
      ),
    );
  }
}
