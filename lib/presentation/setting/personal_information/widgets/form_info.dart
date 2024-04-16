import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/pages/personal_information.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/button.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/field_phone_number.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/show_modal_bottom_sheet.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/verified.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInfo extends StatefulWidget {
  String title;
  String info;
  String button;
  Widget verified;
  String status;

  FormInfo({
    required this.title,
    required this.info,
    required this.button,
    required this.verified,
    required this.status,
  });

  @override
  State<FormInfo> createState() => _FormInfoState();
}

class _FormInfoState extends State<FormInfo> {
  @override
  void initState() {
    super.initState();
    setState(() {
      PersonalInformation.phoneNumber;
    });
  }

  Widget build(BuildContext context) {
    double heightKeyboardOff = MediaQuery.of(context).size.height * 0.36;
    double heightKeyboardON = MediaQuery.of(context).size.height * 0.68;
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.montserrat(
              color: darkGrey200,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
            ),
            height: 74,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: darkGrey900,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: darkGrey800,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.info,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          // isDismissible: false,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                              13,
                            )),
                          ),
                          builder: (context) {
                            return PersonalInformationWidget(
                              titleButton: 'Verify',
                              titleColor: Colors.white,
                              buttonColor: brownColor,
                              title: 'Enter mobile number',
                              subtitle: 'Mobile Number',
                              sizeSubtitle: 13,
                              colorSubtitle: darkGrey200,
                              space: 8,
                              heightSpace: 19,
                              fontWeightSubtitle: FontWeight.w500,
                              height: WidgetsBinding
                                          .instance.window.viewInsets.bottom >
                                      0.0
                                  ? heightKeyboardON
                                  : heightKeyboardOff,
                              widget: FieldPhoneNumber(),
                              onPressed: () {
                                if (FieldPhoneNumber.formKey.currentState!
                                    .validate()) {
                                  setState(() {
                                    PersonalInformation.phoneNumber =
                                        FieldPhoneNumber.phoneNumber.text;
                                  });
                                  Get.back();
                                  Get.snackbar('Mobile Number Update',
                                      'You\'ve changed your mobile number',
                                      snackPosition: SnackPosition.BOTTOM,
                                      borderRadius: 34,
                                      titleText: Text(
                                        'Mobile Number Update',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                      messageText: Text(
                                        'You\'ve changed your mobile number',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                      mainButton: TextButton(
                                          onPressed: () {
                                            Get.closeCurrentSnackbar();
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/exit.svg',
                                          )),
                                      padding: EdgeInsets.only(
                                        left: 25,
                                        top: 16,
                                        bottom: 16,
                                      ),
                                      colorText: Colors.white,
                                      backgroundColor: darkGrey800,
                                      duration: Duration(seconds: 2),
                                      icon: SvgPicture.asset(
                                        'assets/icons/success.svg',
                                      ));
                                }
                                Future.delayed(Duration(seconds: 1), () async {
                                  FieldPhoneNumber.phoneNumber.text = '';
                                });
                              },
                            );
                          },
                        );
                      },
                      child: Text(
                        '${widget.button}',
                        style: GoogleFonts.montserrat(
                          color: brownColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                VerifiedWidget(
                  status: widget.status,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
