import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class SoftStart extends StatefulWidget {
  final int id;
  final String softStart;
  final String isOn;

  SoftStart({
    required this.id,
    required this.softStart,
    required this.isOn,
  });

  @override
  State<SoftStart> createState() => _SoftStartState();
}

class _SoftStartState extends State<SoftStart> {
  late double softStartItem;
  bool isON = true;

  @override
  void initState() {
    super.initState();
    softStartItem = double.parse(widget.softStart);
    isON = widget.isOn == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Soft Start',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              softStartItem = 5;
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
              label: 'Soft Start',
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
              value: softStartItem,
              min: 1,
              max: 10,
              unit: null,
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? softStartItem = value : null;
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
              var dataSlidersoftStart = softStartItem.toInt();

              var dataTrue = 1;
              var dataFalse = 0;

              List<String> dataSoftStartNew = [
                dataSlidersoftStart.toString(),
                (isON == true) ? dataTrue.toString() : dataFalse.toString(),
              ];

              Navigator.pop(context, dataSoftStartNew);
            },
          ),
        ),
      ),
    );
  }
}
