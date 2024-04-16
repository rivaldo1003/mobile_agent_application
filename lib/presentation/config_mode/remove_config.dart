import 'package:elderselettricomobile/presentation/common/alert_bottom_sheet.dart';
import 'package:elderselettricomobile/presentation/config_mode/selectable_config_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/model/config.dart';
import '../../core/values/colors.dart';
import '../common/text_style.dart';

class RemoveConfigPage extends StatefulWidget {
  const RemoveConfigPage({Key? key}) : super(key: key);

  @override
  State<RemoveConfigPage> createState() => _RemoveConfigPageState();
}

class _RemoveConfigPageState extends State<RemoveConfigPage> {

  final List<ConfigMode> configList = [
    ConfigMode(
      id: '0',
      name: 'Comfort',
      description: 'Balance of power and efficiency.',
    ),
    ConfigMode(
      id: '1',
      name: 'Eco',
      description: 'Increase fuel efficiency.',
    ),
    ConfigMode(
      id: '2',
      name: 'Sport',
      description: 'Accelerates more readily.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: SvgPicture.asset('assets/icons/button_back.svg'),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Remove config',
          style: AppTextStyle.title2,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12),
        child: ListView.builder(
            itemCount: configList.length,
            itemBuilder: (context, index) {
              return SelectableConfigMode(
                config: configList[index],
              );
            }),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showConfirmationBottomSheet(
            context,
            title: 'Delete config',
            message:
                'Are you sure want to delete this config? This action cannot be undone.',
            imagePath: 'assets/images/delete_config_illustration.svg',
          );
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/trash.svg',
                height: 20,
                width: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Remove config',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
