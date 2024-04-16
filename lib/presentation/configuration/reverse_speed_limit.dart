import 'dart:io';

import 'package:elderselettricomobile/presentation/configuration/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';

class ReverseSpeedLimit extends StatefulWidget {
  final int id;
  final String reverseSpeedLimit;
  final String isOn;

  ReverseSpeedLimit({
    required this.id,
    required this.reverseSpeedLimit,
    required this.isOn,
  });

  @override
  State<ReverseSpeedLimit> createState() => _ReverseSpeedLimitState();
}

class _ReverseSpeedLimitState extends State<ReverseSpeedLimit> {
  bool isON = false;
  late double reverseSpeedLimitItem;

  @override
  void initState() {
    super.initState();
    reverseSpeedLimitItem = double.parse(widget.reverseSpeedLimit);
    isON = widget.isOn == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
          title: 'Reverse Speed Limit',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onReset: () {
            setState(() {
              isON = true;
              reverseSpeedLimitItem = 30;
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
              label: 'Reverse Speed Limit',
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
              value: reverseSpeedLimitItem,
              min: 10,
              max: 100,
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? reverseSpeedLimitItem = value : null;
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
              var dataSliderreverseSpeedLimit = reverseSpeedLimitItem.toInt();

              var dataTrue = 1;
              var dataFalse = 0;

              List<String> datareverseSpeedLimit2 = [
                dataSliderreverseSpeedLimit.toString(),
                (isON == true) ? dataTrue.toString() : dataFalse.toString(),
              ];

              Navigator.pop(context, datareverseSpeedLimit2);
            },
          ),
        ),
      ),
    );
  }
}
