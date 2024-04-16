import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/setting/set_new_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementAccount extends StatefulWidget {
  @override
  State<ManagementAccount> createState() => _ManagementAccountState();
}

class _ManagementAccountState extends State<ManagementAccount> {
  bool googleActive = false;
  bool facebookActive = false;
  bool appleActive = false;

  Future showModalBottomDeleteAccount(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: darkGrey900,
              borderRadius: BorderRadius.circular(13),
            ),
            height: MediaQuery.of(context).size.height / 1.7,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/icons/handle.svg'),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Are you sure you want to delete your \naccount?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Deleting your account is permanent and cannot be reserved. Your data account will be deleted.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: darkGrey100,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 37),
                Row(
                  children: [
                    Expanded(
                      child: ButtonNewPassword(
                        buttonColor: darkGrey900,
                        tilteColorButton: darkGrey300,
                        titleButton: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: ButtonNewPassword(
                        buttonColor: darkGrey900,
                        tilteColorButton: redColor,
                        titleButton: 'Yes, delete',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
        title: Text(
          'Manage Account',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                ListTileManageAccount(
                  title: 'Change Password',
                  subtitle: 'Change your password at any time.',
                  leading: 'assets/icons/key.svg',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SetNewPassword();
                    }));
                  },
                ),
                SizedBox(height: 32),
                ListTileManageAccount(
                    title: 'Delete Account',
                    subtitle: 'This will permanently delete your account.',
                    leading: 'assets/icons/delete_account.svg',
                    onTap: () {
                      showModalBottomDeleteAccount(context);
                    }),
                SizedBox(height: 28),
              ],
            ),
          ),
          Container(
            height: 16,
            color: darkGrey900,
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Linked accounts',
                  style: GoogleFonts.montserrat().copyWith(
                    color: darkGrey200,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 8),
                buttonSwitchLinkedAccounts(
                  titleProvider: 'Google',
                  iconProvider: 'assets/icons/google.svg',
                ),
                SizedBox(height: 16),
                buttonSwitchLinkedAccounts(
                  titleProvider: 'Facebook',
                  iconProvider: 'assets/icons/facebook.svg',
                ),
                SizedBox(height: 16),
                buttonSwitchLinkedAccounts(
                  titleProvider: 'Apple',
                  iconProvider: 'assets/icons/apple.svg',
                  colorIcon: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonSwitchLinkedAccounts({
    required final String titleProvider,
    required final String iconProvider,
    final Color? colorIcon,
  }) {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconProvider,
                color: colorIcon,
              ),
              SizedBox(width: 12),
              Text(
                titleProvider,
                style: GoogleFonts.montserrat().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          CupertinoSwitch(
              value: googleActive,
              onChanged: (value) {
                setState(() {
                  googleActive = value;
                });
              })
        ],
      ),
    );
  }
}

class ListTileManageAccount extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leading;
  final Function onTap;

  const ListTileManageAccount({
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(leading),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.montserrat(
                      color: darkGrey100,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/chevron_right.svg'),
        ],
      ),
    );
  }
}
