import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class AdjustAccelerator extends StatefulWidget {
  final int id;
  final int adjustAcceleratorValue;

  AdjustAccelerator({required this.id, required this.adjustAcceleratorValue});

  @override
  State<AdjustAccelerator> createState() => _AdjustAcceleratorState();
}

class _AdjustAcceleratorState extends State<AdjustAccelerator> {
  late int adjustAcceleratorValue;

  @override
  void initState() {
    super.initState();
    adjustAcceleratorValue = widget.adjustAcceleratorValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
        title: 'Adjust Accelerator',
        onBackPressed: () {
          Navigator.pop(context);
        },
        onReset: () {
          setState(() {
            adjustAcceleratorValue = 0;
          });
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Adjust Accelerator',
              selections: {0: 'OFF', 1: 'ON'},
              onChanged: (newGroupValue) {
                setState(() {
                  adjustAcceleratorValue = newGroupValue!;
                });
              },
              groupValue: adjustAcceleratorValue,
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
              Navigator.of(context).pop(adjustAcceleratorValue);
            },
          ),
        ),
      ),
    );
  }
}
