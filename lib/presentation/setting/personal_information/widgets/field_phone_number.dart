import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/widgets/form_info.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class FieldPhoneNumber extends StatefulWidget {
  static TextEditingController phoneNumber = TextEditingController();

  static String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);

    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }

  static final formKey = GlobalKey<FormState>();

  @override
  State<FieldPhoneNumber> createState() => _FieldPhoneNumberState();
}

class _FieldPhoneNumberState extends State<FieldPhoneNumber> {
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
        onTap: () {},
        controller: FieldPhoneNumber.phoneNumber,
        showCountryFlag: true,
        disableLengthCheck: false,
        cursorColor: brownColor,
        dropdownTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          color: darkGrey400,
        ),
        flagsButtonPadding: EdgeInsets.only(left: 8),
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: brownColor,
          )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: darkGrey800,
          hintText: 'Enter mobile number',
          hintStyle: TextStyle(
            color: darkGrey200,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
        initialCountryCode: 'ID',
        onChanged: (phone) {
          phoneNumber = phone.toString();
          print(phoneNumber);
        });
  }
}
