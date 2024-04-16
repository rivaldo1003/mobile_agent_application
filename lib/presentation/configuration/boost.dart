import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class Boost extends StatefulWidget {
  final int id;
  final int boostValue;

  Boost({required this.id, required this.boostValue});
  @override
  State<Boost> createState() => _BoostState();
}

class _BoostState extends State<Boost> {
  late int boostValue;

  @override
  void initState() {
    boostValue = widget.boostValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Boost',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              boostValue = 1;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Boost',
              selections: {0: 'OFF', 1: 'ON'},
              onChanged: (newGroupValue) {
                setState(() {
                  boostValue = newGroupValue!;
                });
              },
              groupValue: boostValue,
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
              Navigator.of(context).pop(boostValue);
            },
          ),
        ),
      ),
    );
  }
}
