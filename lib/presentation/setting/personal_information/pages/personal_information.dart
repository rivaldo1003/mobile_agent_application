import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/domain/model/profile.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/app_bar.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/button.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/field_phone_number.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/loading_shimmer.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/profile_photo.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/show_modal_bottom_sheet.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/verification_code.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/verified.dart';
import 'package:elderselettricomobile/presentation/setting/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
import '../widgets/form_info.dart';
import 'package:http/http.dart' as http;

class PersonalInformation extends StatefulWidget {
  static final formKey = GlobalKey<FormState>();
  static String phoneNumber = '+62 82197629818';

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController _name = TextEditingController();

  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  PhoneNumber? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final profilState = context.watch<ProfileViewModel>().state;
    return Scaffold(
      backgroundColor: darkGrey900,
      appBar: AppBarWidget.appBarWidget,
      body: SingleChildScrollView(
        child: _buildAccountDetails(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: ButtonWidget(
        title: 'Save',
        titleColor: (_name.text.isNotEmpty && _name.text.length > 5)
            ? Colors.white
            : darkGrey200,
        color: (_name.text.isNotEmpty && _name.text.length > 5)
            ? brownColor
            : darkGrey500,
        marginHorizontal: 16,
        widget: PersonalInformationWidget(
          titleColor: Colors.white,
          buttonColor: brownColor,
          titleButton: 'Next',
          title: 'Verify your number',
          sizeSubtitle: 17,
          subtitle: 'Enter the 6-digit verification code',
          colorSubtitle: Colors.white,
          infoText: 'We send a code to +6281 1316 ****\n'
              'This code will expired in ',
          timeExp: '01.30',
          infoCode: 'Don\'t received the code? ',
          space: 40,
          heightSpace: 27,
          textButtonResendCode: 'Resend Code',
          fontWeightSubtitle: FontWeight.w600,
          height: MediaQuery.of(context).size.height * 0.92,
          widget: VerificationCodeWidget(),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      PersonalInformation.phoneNumber;
    });
  }

  Widget _buildAccountDetails(BuildContext context) {
    final profilState = context.watch<ProfileViewModel>().state;
    return Form(
        key: PersonalInformation.formKey,
        child: profilState.maybeWhen(
          success: (data) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                          13,
                        ))),
                        builder: (context) {
                          return ProfilePhotoBottomSheet();
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        image == null
                            ? Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    '${_getName(data)[0]}',
                                    style: GoogleFonts.montserrat(
                                      color: brownColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  height: 64,
                                  width: 64,
                                  child: Image.file(
                                    File(image!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        SizedBox(height: 12),
                        Text(
                          'Change photo profile',
                          style: GoogleFonts.montserrat(
                            color: brownColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.montserrat(
                          color: darkGrey200,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        // height: 44,
                        child: TextFormField(
                          onChanged: (value) {
                            value = _name.text;
                          },
                          cursorColor: brownColor,
                          controller: _name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'ex: Elders Elettrico',
                            hintStyle: GoogleFonts.montserrat(
                              color: darkGrey300,
                            ),
                            filled: true,
                            fillColor: darkGrey800,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: brownColor,
                            )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value != null || value!.isNotEmpty) {
                              if (value.length > 5) {
                                return null;
                              } else {
                                return "Enter valid name of more then 5 characters!";
                              }
                            } else {
                              return 'Please enter some text';
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                FormInfo(
                  title: 'Mobile Phone',
                  info: PersonalInformation.phoneNumber,
                  button: 'Change',
                  verified: VerifiedWidget(),
                  status: 'Verified',
                ),
                SizedBox(height: 16),
                FormInfo(
                  title: 'Email Address',
                  info: '${_getEmail(data)}',
                  button: '',
                  verified: VerifiedWidget(),
                  status: 'Verified',
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.only(
                    left: 14,
                    right: 14,
                  ),
                  child: Text(
                    'You will receive every notification & security information on this email.',
                    style: GoogleFonts.montserrat(
                      color: darkGrey200,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            );
          },
          orElse: () => LoadingShimmer(),
        ));
  }

  String _getName(Profile? data) {
    var name = 'Elders Elettrico';
    if (data != null) {
      name = data.name;
    }
    return name;
  }

  String _getEmail(Profile? data) {
    var email = '';
    if (data != null) {
      email = data.email;
    }
    return email;
  }

  String _(Profile? data) {
    var phoneNumber = '';
    if (data != null) {
      phoneNumber = data.mobilePhoneNumber!;
    }
    return phoneNumber;
  }
}

class AddPhoto extends StatelessWidget {
  final String icon;
  final String title;

  AddPhoto({
    required this.icon,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset('${icon}'),
            SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SvgPicture.asset('assets/icons/chevron_right.svg'),
      ],
    );
  }
}
