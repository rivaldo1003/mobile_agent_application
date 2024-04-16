import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class EcoMode extends StatefulWidget {
  final int id;
  final int ecoMode;
  EcoMode({required this.id, required this.ecoMode});
  @override
  State<EcoMode> createState() => _EcoModeState();
}

class _EcoModeState extends State<EcoMode> {
  int groupValueEcoMode = 0;

  @override
  void initState() {
    super.initState();
    groupValueEcoMode = widget.ecoMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Eco Mode',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              groupValueEcoMode = 0;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Eco Mode',
              selections: {0: 'OFF', 1: 'ON'},
              onChanged: (newGroupValue) {
                setState(() {
                  groupValueEcoMode = newGroupValue!;
                });
              },
              groupValue: groupValueEcoMode,
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
              Navigator.of(context).pop(groupValueEcoMode);
            },
          ),
        ),
      ),
    );
  }
}
