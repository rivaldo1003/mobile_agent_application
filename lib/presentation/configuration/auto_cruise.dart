import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class AutoCruise extends StatefulWidget {
  final int id;
  final int autoCruiseValue;

  AutoCruise({required this.id, required this.autoCruiseValue});
  @override
  State<AutoCruise> createState() => _AutoCruiseState();
}

class _AutoCruiseState extends State<AutoCruise> {
  late int autoCruiseValue;

  @override
  void initState() {
    autoCruiseValue = widget.autoCruiseValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Auto Cruise',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              autoCruiseValue = 0;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Auto Cruise',
              selections: {0: 'OFF', 1: 'ON'},
              onChanged: (newGroupValue) {
                setState(() {
                  autoCruiseValue = newGroupValue!;
                });
              },
              groupValue: autoCruiseValue,
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
              Navigator.of(context).pop(autoCruiseValue);
            },
          ),
        ),
      ),
    );
  }
}
