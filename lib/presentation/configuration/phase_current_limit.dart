import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';

class PhaseCurrentLimit extends StatefulWidget {
  final int id;
  final double phaseCurrentLimit;

  PhaseCurrentLimit({required this.id, required this.phaseCurrentLimit});

  @override
  State<PhaseCurrentLimit> createState() => _PhaseCurrentLimitState();
}

class _PhaseCurrentLimitState extends State<PhaseCurrentLimit> {
  bool isON = false;
  late double phaseCurrentLimitItem;

  void saveData() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('phase_current_limit_on', isON);
  }

  Future<bool> getON() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('phase_current_limit_on') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getON().then((value) {
      isON = value;
      setState(() {});
    });
    phaseCurrentLimitItem = widget.phaseCurrentLimit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Phase Current Limit',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              phaseCurrentLimitItem = 100;
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
              label: 'Phase Current Limit',
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
              value: phaseCurrentLimitItem,
              min: 50,
              max: 100,
              unit: "%",
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? phaseCurrentLimitItem = value : null;
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

              var dataSliderphaseCurrentLimit = phaseCurrentLimitItem.toInt();
              Navigator.pop(context, dataSliderphaseCurrentLimit);
            },
          ),
        ),
      ),
    );
  }
}
