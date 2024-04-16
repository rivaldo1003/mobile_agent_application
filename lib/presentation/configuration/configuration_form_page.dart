import 'dart:io';

import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/values/strings.dart';
import '../../domain/model/config/config_form.dart';
import '../common/primary_button.dart';
import '../form/segmented_control_form.dart';
import '../form/slider_form.dart';
import '../form/switch_form.dart';
import 'widgets/form_descirption.dart';
import 'widgets/setting_appbar.dart';

class ConfigurationFormPage extends StatefulWidget {
  const ConfigurationFormPage({required this.form, required this.value});

  final ConfigForm form;
  final dynamic value;

  @override
  State<ConfigurationFormPage> createState() => _ConfigurationFormPageState();
}

class _ConfigurationFormPageState extends State<ConfigurationFormPage> {
  late dynamic itemValue;
  late bool isEnabled;

  @override
  void initState() {
    this.itemValue = widget.value;
    this.isEnabled = widget.form.enabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
        title: widget.form.title,
        onBackPressed: () {
          Navigator.pop(context);
        },
        onReset: _resetData,
      ),
      body: _buildForm(),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 8 : 16),
        child: LargePrimaryButton(
          label: 'Save',
          onTap: () {
            Navigator.pop(context, itemValue);
          },
        ),
      )),
    );
  }

  Widget _buildForm() {
    final inputType = FormInputType.getEnum(widget.form.inputType);
    switch (inputType) {
      case FormInputType.slider:
        return Column(
          children: [
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: SwitchForm(
                label: widget.form.title,
                value: isEnabled,
                onChanged: (value) {
                  setState(() {
                    isEnabled = value;
                  });
                },
              ),
            ),
            ConfigFormDescription(
              label: AppStrings.configSliderFormDescription,
            ),
            Container(
              padding: EdgeInsets.only(top: 28, left: 8),
              width: MediaQuery.of(context).size.width,
              child: SliderForm(
                value: jsonToDouble(itemValue),
                min: widget.form.min?.toDouble() ?? 0,
                max: widget.form.max?.toDouble() ?? 0,
                unit: widget.form.unit,
                isEnabled: isEnabled,
                onChanged: (value) {
                  setState(() {
                    isEnabled ? itemValue = value : null;
                  });
                },
              ),
            ),
          ],
        );
      case FormInputType.segmentedControl:
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: SegmentedControlForm(
                label: widget.form.title,
                selections: Map.fromIterable(widget.form.selections,
                    key: (e) => e.key, value: (e) => e.label),
                onChanged: (newGroupValue) {
                  setState(() {
                    itemValue = newGroupValue!;
                  });
                },
                groupValue: itemValue,
              ),
            ),
            ConfigFormDescription(
                label: AppStrings.configSelectionFormDescription),
          ],
        );
      default:
        return Container();
    }
  }

  void _resetData() {
    setState(() {
      this.itemValue = widget.form.defaultValue ?? 0;
      this.isEnabled = widget.form.enabled;
    });
  }
}
