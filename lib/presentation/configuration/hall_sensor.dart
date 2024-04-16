import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class HallSensor extends StatefulWidget {
  final int id;
  final int hallSensorValue;

  HallSensor({required this.id, required this.hallSensorValue});
  @override
  State<HallSensor> createState() => _HallSensorItemState();
}

class _HallSensorItemState extends State<HallSensor> {
  late int hallSensorValue;

  @override
  void initState() {
    super.initState();
    hallSensorValue = widget.hallSensorValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Hall Sensor',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              hallSensorValue = 1;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Hall Sensor',
              selections: {0: '60', 1: '120'},
              onChanged: (newGroupValue) {
                setState(() {
                  hallSensorValue = newGroupValue!;
                });
              },
              groupValue: hallSensorValue,
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
              Navigator.of(context).pop(hallSensorValue);
            },
          ),
        ),
      ),
    );
  }
}
