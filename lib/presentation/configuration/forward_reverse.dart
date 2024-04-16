import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import 'widgets/form_descirption.dart';

class ForwardReverse extends StatefulWidget {
  final int id;
  final int forwardReverse;

  ForwardReverse({required this.id, required this.forwardReverse});
  @override
  State<ForwardReverse> createState() => _ForwardReverseState();
}

class _ForwardReverseState extends State<ForwardReverse> {
  late int forwardReverse;

  @override
  void initState() {
    super.initState();
    forwardReverse = widget.forwardReverse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Forward/Reverse',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              forwardReverse = 1;
            });
          }),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SegmentedControlForm(
              label: 'Forward/Reverse',
              selections: {0: 'Reverse', 1: 'Forward'},
              onChanged: (newGroupValue) {
                setState(() {
                  forwardReverse = newGroupValue!;
                });
              },
              groupValue: forwardReverse,
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
              Navigator.of(context).pop(forwardReverse);
            },
          ),
        ),
      ),
    );
  }
}
