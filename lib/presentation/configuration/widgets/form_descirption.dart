import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';

import '../../../core/values/colors.dart';

class ConfigFormDescription extends StatelessWidget {
  const ConfigFormDescription({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: darkGrey800,
      padding: const EdgeInsets.only(
        left: 16,
        top: 12,
        right: 16,
        bottom: 24,
      ),
      child: Text(
        label,
        style: AppTextStyle.subtitle7,
      ),
    );
  }
}
