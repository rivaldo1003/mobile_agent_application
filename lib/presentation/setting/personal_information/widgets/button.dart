import 'package:elderselettricomobile/presentation/setting/personal_information/pages/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  int marginHorizontal;
  Color color;
  Color titleColor;
  Widget? widget;

  ButtonWidget({
    required this.title,
    required this.marginHorizontal,
    required this.color,
    required this.titleColor,
    this.widget,
  });

  showBott(BuildContext context) async {
    if (PersonalInformation.formKey.currentState!.validate()) {
      await showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          isScrollControlled: true,
          builder: (context) {
            return widget!;
          });
    }
  }

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
          horizontal: marginHorizontal.toDouble(),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: () {
            showBott(context);
          },
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
