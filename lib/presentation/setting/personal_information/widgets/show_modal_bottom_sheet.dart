import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/field_phone_number.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/form_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';

class PersonalInformationWidget extends StatefulWidget {
  final String title;
  final double height;
  final String subtitle;
  final double sizeSubtitle;
  final Color colorSubtitle;
  final Color titleColor;
  final Color buttonColor;
  String? infoText;
  String? timeExp;
  String? infoCode;
  String? textButtonResendCode;
  final double space;
  final double heightSpace;
  final FontWeight fontWeightSubtitle;
  Widget? widget;
  final Function() onPressed;
  final String titleButton;

  PersonalInformationWidget({
    required this.title,
    required this.height,
    required this.subtitle,
    required this.sizeSubtitle,
    required this.colorSubtitle,
    required this.titleColor,
    this.infoText,
    this.timeExp,
    this.infoCode,
    this.textButtonResendCode,
    required this.space,
    required this.heightSpace,
    required this.fontWeightSubtitle,
    this.widget,
    required this.onPressed,
    required this.titleButton,
    required this.buttonColor,
  });

  @override
  State<PersonalInformationWidget> createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkGrey900,
        borderRadius: BorderRadius.circular(13),
      ),
      height: widget.height.toDouble(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Form(
              key: FieldPhoneNumber.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SvgPicture.asset('assets/icons/handle.svg'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: widget.heightSpace),
                        Text(
                          '${widget.subtitle}',
                          style: GoogleFonts.montserrat(
                            color: widget.colorSubtitle,
                            fontSize: widget.sizeSubtitle,
                            fontWeight: widget.fontWeightSubtitle,
                          ),
                        ),
                        SizedBox(height: 2),
                        (widget.infoText != null && widget.timeExp != null)
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: widget.infoText ?? null,
                                      style: GoogleFonts.montserrat(
                                        color: darkGrey100,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.timeExp ?? null,
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(height: widget.space),
                        widget.widget!,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: widget.infoCode ?? null,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: darkGrey100,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: widget.textButtonResendCode ?? null,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: brownColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
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
                            widget.buttonColor,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: widget.onPressed,
                        // if (FieldPhoneNumber.formKey.currentState!
                        //     .validate()) {
                        //   Get.back();

                        //   Get.snackbar(
                        //     'Mobile number update',
                        //     'You\'ve changed your mobile number',
                        //     snackPosition: SnackPosition.BOTTOM,
                        //     icon: Padding(
                        //       padding: EdgeInsets.only(left: 2),
                        //       child: SvgPicture.asset(
                        //           'assets/icons/success.svg'),
                        //     ),
                        //     borderRadius: 34,
                        //   );

                        child: Text(
                          widget.titleButton,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
