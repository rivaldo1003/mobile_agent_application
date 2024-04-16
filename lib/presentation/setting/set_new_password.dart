import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/setting/management_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SetNewPassword extends StatefulWidget {
  static final formKeyPass = GlobalKey<FormState>();

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  Future showModalBottomNewPassword(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: darkGrey900,
              borderRadius: BorderRadius.circular(13),
            ),
            height: MediaQuery.of(context).size.height / 1.5,
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
                          'Enter the right password for the account',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'You’ve entered the wrong password. Make sure you enter the current password for this account.',
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
                SizedBox(height: 24),
                ButtonNewPassword(
                  titleButton: 'OK',
                  tilteColorButton: Colors.white,
                  buttonColor: brownColor,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return ManagementAccount();
                    }));
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonNewPassword(
        titleButton: 'Confirm',
        buttonColor: (currentPassword.text.isNotEmpty ||
                newPassword.text.isNotEmpty ||
                confirmNewPassword.text.isNotEmpty)
            ? brownColor
            : darkGrey800,
        tilteColorButton: Colors.white,
        onPressed: () {
          if (SetNewPassword.formKeyPass.currentState!.validate()) {
            return null;
          } else {
            return showModalBottomNewPassword(context);
          }
        },
      ),
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
          'Set new password',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Form(
          key: SetNewPassword.formKeyPass,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldNewPassword(
                title: 'Current Password',
                textEditingController: currentPassword,
                obscureText: true,
                validatorTextField: (value) {
                  if (currentPassword.text.isEmpty) {
                    if (currentPassword.text.length < 7) {
                      return 'Password harus lebih dari 7 karakter';
                    } else {
                      return null;
                    }
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16),
              TextFieldNewPassword(
                title: 'New Password',
                textEditingController: newPassword,
                obscureText: true,
                validatorTextField: (value) {
                  if (newPassword.text.isEmpty) {
                    if (newPassword.text.length < 7) {
                      return 'Password harus lebih dari 7 karakter';
                    } else {
                      return null;
                    }
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16),
              TextFieldNewPassword(
                title: 'Confirm New Password',
                textEditingController: confirmNewPassword,
                obscureText: true,
                validatorTextField: (value) {
                  if (confirmNewPassword.text.isNotEmpty) {
                    if (confirmNewPassword.text.length < 7) {
                      return 'Password harus lebih dari 7 karakter';
                    } else {
                      return null;
                    }
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We recommend choosing a password that:',
                      style: GoogleFonts.montserrat().copyWith(
                        color: darkGrey200,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2),
                    buildRules(title: 'Is 7 characters long or more'),
                    buildRules(
                        title: 'Uses upper and lowercase letters combinations'),
                    buildRules(
                        title:
                            'Uses numbers (0-9) and special symbols (!@\$^*...)'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRules({
    required final String title,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/dot.svg',
          color: darkGrey200,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.montserrat().copyWith(
            color: darkGrey200,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ButtonNewPassword extends StatelessWidget {
  final String titleButton;
  final Function onPressed;
  final Color buttonColor;
  final Color tilteColorButton;
  ButtonNewPassword({
    required this.titleButton,
    required this.onPressed,
    required this.buttonColor,
    required this.tilteColorButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 0,
        right: 0,
        bottom: 42,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              buttonColor,
            ),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: () => onPressed(),
          child: Text(
            titleButton,
            style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: tilteColorButton,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldNewPassword extends StatefulWidget {
  final String title;
  bool obscureText;
  final TextEditingController textEditingController;
  final Function(String?)? validatorTextField;

  TextFieldNewPassword({
    required this.title,
    required this.obscureText,
    required this.textEditingController,
    required this.validatorTextField,
  });

  @override
  State<TextFieldNewPassword> createState() => _TextFieldNewPasswordState();
}

class _TextFieldNewPasswordState extends State<TextFieldNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.montserrat().copyWith(
              color: darkGrey200,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: Stack(
              children: [
                TextFormField(
                  obscureText: widget.obscureText,
                  controller: widget.textEditingController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: darkGrey800,
                    filled: true,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {},
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: widget.obscureText
                          ? SvgPicture.asset('assets/icons/hide_password.svg')
                          : SvgPicture.asset('assets/icons/show_password.svg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
