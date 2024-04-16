import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class ManualCruise extends StatefulWidget {
  final int id;
  final int manualCruiseValue;

  ManualCruise({required this.id, required this.manualCruiseValue});
  @override
  State<ManualCruise> createState() => _ManualCruiseState();
}

class _ManualCruiseState extends State<ManualCruise> {
  late int manualCruiseValue;

  @override
  void initState() {
    manualCruiseValue = widget.manualCruiseValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
        title: 'Manual Cruise',
        onBackPressed: () {
          Navigator.pop(context);
        },
        onReset: () {
          setState(() {
            manualCruiseValue = 1;
          });
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Manual Cruise',
              selections: {0: 'OFF', 1: 'ON'},
              onChanged: (newGroupValue) {
                setState(() {
                  manualCruiseValue = newGroupValue!;
                });
              },
              groupValue: manualCruiseValue,
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
              Navigator.of(context).pop(manualCruiseValue);
            },
          ),
        ),
      ),
    );
  }
}
