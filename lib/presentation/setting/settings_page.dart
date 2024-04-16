import 'dart:async';

import 'package:elderselettricomobile/domain/model/profile.dart';
import 'package:elderselettricomobile/presentation/common/alert_bottom_sheet.dart';
import 'package:elderselettricomobile/presentation/setting/app_notifications.dart';
import 'package:elderselettricomobile/presentation/setting/management_account.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/pages/personal_information.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/loading_shimmer.dart';
import 'package:elderselettricomobile/presentation/setting/profile_viewmodel.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:elderselettricomobile/presentation/setting/security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/values/icons.dart';
import '../common/alert_snackbar.dart';
import '../sign_in/sign_in_page.dart';

import 'privacy_and_policy.dart';
import 'term_and_conditions.dart';
import 'about.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({this.onLogout});

  final void Function()? onLogout;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    _init();
    context.read<ProfileViewModel>().getProfile();
    super.initState();
  }

  String _versionName = '';

  void _init() async {
    final _packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _versionName = _packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Settings',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAccountHeader(),
                BuildItemSettings(
                  titleItem: 'Manage Account',
                  icon: 'manage_account',
                  subtitle: 'Update information and manage your account. ',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ManagementAccount();
                    }));
                  },
                ),
                BuildItemSettings(
                  titleItem: 'Security',
                  icon: 'lock',
                  subtitle: 'Manage your account\'s security.',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Security();
                    }));
                  },
                ),
                BuildItemSettings(
                  titleItem: 'App Notifications',
                  icon: 'bell',
                  subtitle:
                      'Select the kinds of notifications you get about your activities.',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AppNotifications();
                    }));
                  },
                ),
                SizedBox(height: 12),
                Container(
                  height: 16,
                  color: darkGrey900,
                ),
                Container(
                  color: surfaceColor,
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildItemSettings(
                        titleItem: 'About Us',
                        icon: 'info_circle',
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return About();
                          }));
                        },
                      ),
                      SizedBox(height: 2),
                      BuildItemSettings(
                        titleItem: 'Privacy and Policy',
                        icon: 'book',
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PrivacyPolicy();
                          }));
                        },
                      ),
                      SizedBox(height: 2),
                      BuildItemSettings(
                        titleItem: 'Terms and Conditions',
                        icon: 'book',
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return TermAndConditions();
                          }));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 48,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: darkGrey600,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _showLogoutDialog();
                        });
                      },
                      borderRadius: BorderRadius.circular(24),
                      splashColor: Colors.grey,
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style: AppTextStyle.title4,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Elders Mobile App v ${_versionName}',
                  style: AppTextStyle.subtitle8,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountHeader() {
    final profilState = context.watch<ProfileViewModel>().state;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: profilState.maybeWhen(
          success: (data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Text(
                        '${_getName(data)[0]}',
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_getName(data)}',
                          style: AppTextStyle.title4,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${_getEmail(data)}',
                          style: AppTextStyle.subtitle3,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '+62 82197629818',
                          style: AppTextStyle.subtitle3,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PersonalInformation();
                    }));
                  },
                  child: AppIcons.svg('edit_button'),
                )
              ],
            );
          },
          orElse: () => LoadingShimmer()),
    );
  }

  String _getName(Profile? data) {
    var name = 'Elders Elettrico';
    if (data != null) {
      name = data.name;
    }
    return name;
  }

  String _getEmail(Profile? data) {
    var name = '-';
    if (data != null) {
      name = data.email;
    }
    return name;
  }

  void _showLogoutDialog() {
    showConfirmationAlertDialog(
      context,
      title: "Sign Out Confirmation",
      message: "Are you sure you want to sign out?",
      onConfirm: doLogOut,
    );
  }

  void doLogOut() {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        });
    context.read<ProfileViewModel>().logOut().then((value) => loadingLogOut());
  }

  Future<Timer> loadingLogOut() async {
    widget.onLogout?.call();
    var duration = Duration(seconds: 1);
    return Timer(duration, () async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return SignInPage();
      }), (_) => false);

      showSuccessSnackBar(
          'Notification', 'You have successfully been logged out');
    });
  }
}

class BuildItemSettings extends StatelessWidget {
  final String titleItem;
  final String icon;
  final String? subtitle;
  final void Function()? onTap;

  BuildItemSettings({
    required this.titleItem,
    required this.icon,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: subtitle != null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcons.svg(
                      icon,
                      color: darkGrey100,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleItem,
                            style: AppTextStyle.title4,
                          ),
                          subtitle != null ? SizedBox(height: 3) : Container(),
                          subtitle != null
                              ? Text(
                                  subtitle!,
                                  maxLines: 2,
                                  style: AppTextStyle.subtitle6,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset('assets/icons/chevron_right.svg')
            ],
          ),
        ),
      ),
    );
  }
}
