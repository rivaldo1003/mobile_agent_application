import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/values/colors.dart';
import '../common/primary_button.dart';
import '../common/text_style.dart';

class TireDiameter extends StatefulWidget {
  const TireDiameter({required this.tireDiameter, this.deviceId});

  final double tireDiameter;
  final String? deviceId;

  @override
  State<TireDiameter> createState() => _TireDiameterState();
}

class _TireDiameterState extends State<TireDiameter> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    _textFieldController.text = widget.tireDiameter.toString();
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        elevation: 0,
        title: Text(
          'Tire Diameter',
          style: AppTextStyle.title2,
        ),
        centerTitle: true,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: SvgPicture.asset('assets/icons/button_back.svg'),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tire Diameter',
              style: AppTextStyle.formLabel2,
            ),
            SizedBox(height: 8),
            Container(
              height: 44,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: darkGrey800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textFieldController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]+.?[0-9]*'))
                      ],
                      style: AppTextStyle.formInput,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter tire diameter',
                        hintStyle: AppTextStyle.formHint,
                        contentPadding: EdgeInsets.only(left: 14, bottom: 8),
                      ),
                    ),
                  ),
                  Text(
                    'm',
                    style: AppTextStyle.formHint,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 8 : 16),
          child: LargePrimaryButton(
            label: 'Save',
            onTap: () async {
              final tireDiameter = _textFieldController.text;
              final tireDiameterValue =
                  double.parse(tireDiameter.replaceAll(',', '.'));
              final pref = await SharedPreferences.getInstance();
              pref.setDouble(
                  'tireDiameter_${widget.deviceId}', tireDiameterValue);
              Navigator.of(context).pop(tireDiameterValue);
            },
          ),
        ),
      ),
    );
  }
}
