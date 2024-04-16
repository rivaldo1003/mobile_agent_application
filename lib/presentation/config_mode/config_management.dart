import 'package:elderselettricomobile/presentation/config_mode/config_mode_tile.dart';
import 'package:elderselettricomobile/presentation/config_mode/remove_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/model/config.dart';
import '../../core/values/colors.dart';
import '../common/text_style.dart';

enum ConfigMenuItem { edit, delete }

class ConfigManagementPage extends StatelessWidget {
  ConfigManagementPage({Key? key}) : super(key: key);

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
          'List management',
          style: AppTextStyle.title2,
        ),
        actions: [
          PopupMenuButton<ConfigMenuItem>(
            color: darkGrey800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onSelected: (ConfigMenuItem item) {
              switch (item) {
                case ConfigMenuItem.delete:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RemoveConfigPage(),
                    ),
                  );
                  break;
                case ConfigMenuItem.edit:
                  print('edit');
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                height: 44,
                value: ConfigMenuItem.edit,
                child: Row(
                  children: [
                    Icon(Icons.mode_edit, size: 16),
                    SizedBox(width: 12),
                    Text(
                      'Edit',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                height: 44,
                value: ConfigMenuItem.delete,
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, size: 16, color: redColor),
                    SizedBox(width: 12),
                    Text(
                      'Remove config',
                      style: GoogleFonts.montserrat(
                          color: redColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12),
        child: ListView.builder(
            itemCount: configList.length,
            itemBuilder: (context, index) {
              return ConfigModeTile(
                config: configList[index],
              );
            }),
      ),
    );
  }
}
