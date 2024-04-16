import 'dart:io';

import 'package:collection/collection.dart';
import 'package:elderselettricomobile/domain/model/config/config_form.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:elderselettricomobile/presentation/configuration/configuration_form_page.dart';
import 'package:elderselettricomobile/presentation/configuration/viewmodel/configuration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/values/colors.dart';
import '../../core/values/icons.dart';
import '../common/alert_bottom_sheet.dart';
import 'widgets/setting_appbar.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({
    this.readCharacteristic,
    this.writeCharacteristic,
    this.mcuVersion,
    required this.controllerType,
  });

  final QualifiedCharacteristic? readCharacteristic;
  final QualifiedCharacteristic? writeCharacteristic;
  final int controllerType;
  final int? mcuVersion;

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    context.read<ConfigurationViewModel>().getPageTabs().then((value) {
      _tabController = TabController(length: value.length, vsync: this);
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ConfigurationViewModel>();
    return Scaffold(
      appBar: SettingAppBar(
        title: 'Configuration',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: _tabController != null
          ? Column(children: [
              _buildConfigMode(),
              SizedBox(height: 16),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                labelStyle: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w500),
                tabs:
                    viewModel.tabs.map((tab) => Tab(text: tab.title)).toList(),
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: viewModel.tabs
                    .mapIndexed((index, tab) => _buildConfigMenu(index))
                    .toList(),
              ))
            ])
          : Container(),
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: EdgeInsets.only(
            top: 16, bottom: Platform.isIOS ? 8 : 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(24),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.read<ConfigurationViewModel>().getUploadData();
                  },
                  borderRadius: BorderRadius.circular(24),
                  splashColor: Colors.grey,
                  child: Center(
                    child: viewModel.isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : Text(
                            'Apply',
                            style: AppTextStyle.buttonLabel,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildConfigMode() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/chevron_left.svg'),
          SizedBox(width: 16),
          Column(
            children: [
              Text(
                'Config mode',
                style: GoogleFonts.montserrat(
                  color: darkGrey100,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.svg('bold/speedometer'),
                  SizedBox(width: 6),
                  Text(
                    'Comfort',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 16),
          SvgPicture.asset('assets/icons/chevron_right.svg'),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              margin: EdgeInsets.only(left: 16),
              child: AppIcons.svg('linear/copy'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigMenu(int tabIndex) {
    final viewModel = context.watch<ConfigurationViewModel>();
    final configForms = viewModel.configFormMap[tabIndex] ?? [];
    if (configForms.isEmpty) {
      return Container();
    } else {
      return Column(
        children: configForms.map((form) {
          if (form.index == null) return Container();
          return ConfigMenuItem(
              tabIndex: tabIndex,
              formIndex: form.index!,
              form: form,
              value: viewModel.formValueMap[tabIndex]![form.index!],
              unit: form.unit);
        }).toList(),
      );
    }
  }

  void _onUploadSuccess() {
    showSuccessModalBottomSheet(
      context,
      title: 'Great!',
      message: "Config has been uploaded successfully",
      onConfirm: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }

  void _onUploadFailed() {
    showErrorModalBottomSheet(
      context,
      title: "Can't upload configuration",
      message: "We're sorry, something has gone wrong. Please try later.",
    );
  }
}

class ConfigMenuItem extends StatelessWidget {
  const ConfigMenuItem({
    required this.tabIndex,
    required this.formIndex,
    required this.form,
    required this.value,
    required this.unit,
  });

  final int tabIndex;
  final int formIndex;
  final ConfigForm form;
  final dynamic value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    String formattedValue = '$value${unit != null ? ' $unit' : ''}';

    return InkWell(
      onTap: () async {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ConfigurationFormPage(form: form, value: value);
            },
          ),
        );
        if (result == null) return;
        context.read<ConfigurationViewModel>().updateFormValue(
            tabIndex: tabIndex, formIndex: formIndex, value: result);
      },
      child: Column(
        children: [
          ListTile(
            title: Text(
              form.title,
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              formattedValue,
              style: GoogleFonts.montserrat(
                color: darkGrey200,
                fontSize: 13.5,
              ),
            ),
            trailing: AppIcons.svg(
              'chevron_right',
              color: darkGrey200,
            ),
          ),
          Divider(
            color: darkGrey600,
            height: 1,
          ),
        ],
      ),
    );
  }
}
