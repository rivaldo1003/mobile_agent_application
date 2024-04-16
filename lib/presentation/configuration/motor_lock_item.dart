import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class MotorLock extends StatefulWidget {
  final int id;
  final int motorLockValue;

  MotorLock({required this.id, required this.motorLockValue});

  @override
  State<MotorLock> createState() => _MotorLockState();
}

class _MotorLockState extends State<MotorLock> {
  late int motorLockValue;

  @override
  void initState() {
    super.initState();
    motorLockValue = widget.motorLockValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Motor Lock',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              motorLockValue = 0;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Motor Lock',
              selections: {0: 'OFF', 1: 'ON'},
              onChanged: (newGroupValue) {
                setState(() {
                  motorLockValue = newGroupValue!;
                });
              },
              groupValue: motorLockValue,
            ),
          ),
          ConfigFormDescription(
              label: AppStrings.configSelectionFormDescription),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 8 : 16),
          child: LargePrimaryButton(
            label: 'Save',
            onTap: () {
              Navigator.of(context).pop(motorLockValue);
            },
          ),
        ),
      ),
    );
  }
}
