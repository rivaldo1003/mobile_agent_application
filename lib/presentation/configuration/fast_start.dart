import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../common/primary_button.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class FastStart extends StatefulWidget {
  final int id;
  final String fastStart;
  final String isOn;

  FastStart({
    required this.id,
    required this.fastStart,
    required this.isOn,
  });

  @override
  State<FastStart> createState() => _FastStartNewItemState();
}

class _FastStartNewItemState extends State<FastStart> {
  late double fastStartItem;
  bool isON = true;

  void resetData() async {
    setState(() {
      fastStartItem = 5;
      isON = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fastStartItem = double.parse(widget.fastStart);
    isON = widget.isOn == '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
        title: 'Fast Start',
        onBackPressed: () {
          Navigator.pop(context);
        },
        onReset: resetData,
      ),
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
              label: 'Fast Start',
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
            padding: EdgeInsets.only(top: 28, left: 8),
            width: MediaQuery.of(context).size.width,
            child: SliderForm(
              value: fastStartItem,
              min: 1,
              max: 10,
              unit: null,
              isEnabled: isON,
              onChanged: (value) {
                setState(() {
                  isON ? fastStartItem = value : null;
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
              var dataTrue = 1;
              var dataFalse = 0;

              List<String> dataFastStartNew = [
                fastStartItem.toInt().toString(),
                (isON == true) ? dataTrue.toString() : dataFalse.toString(),
              ];

              Navigator.pop(context, dataFastStartNew);
            },
          ),
        ),
      ),
    );
  }
}
