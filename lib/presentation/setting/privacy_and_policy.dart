import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool isON = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey900,
      appBar: AppBar(
        backgroundColor: darkGrey900,
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
          'Privacy Policy ',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ELDERS ELETTRICO',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Privacy Policy',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1.',
                  style: GoogleFonts.montserrat(
                    color: darkGrey50,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Personal Information We advise you to read our Privacy Policy as it describes what happens to your personal information (being information or an opinion about you, whether true or not, which identifies you or from which your identity can be reasonably identifiable). By downloading and/or using the Elders Elettrico Mobile Application (“App”) where applicable and from time to time, certain personal information may automatically be collected and/or given by you including your date of birth, gender.'
                      'We are committed to ensuring the security of your personal information and we will take all reasonable precautions to protect this personal information from loss, misuse or alteration. If we believe that there is unauthorized use of your personal information, we may inform you in accordance to our policy and relevant law.',
                      style: GoogleFonts.montserrat(
                        color: darkGrey50,
                      ),
                    ),
                    // color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2.',
                  style: GoogleFonts.montserrat(
                    color: darkGrey50,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'AddressBy downloading and/or using the App information about your address, location and your mobile device, including a unique identifier for your device may also be requested. We may use this information to provide you with location-based services, such as search results, and other personalized content. Please note most mobile devices provide users with the ability to disable location services if you do not want to be geolocalised.Common language to add regarding the use and their consent ELDERS ELETTRICO may share this personal information with its parent company and affiliates and use it consistent with its Privacy Policy. The App may contain links to third party website. We advise that the terms of this Privacy Policy do not apply to external third party websites, and those sites may have their own privacy policies. If you wish to find out how any third parties handle your personal information, you will need to obtain a copy of their privacy policy.',
                      style: GoogleFonts.montserrat(
                        color: darkGrey50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "By downloading and/or using the App, you consent to the use of your personal information as described above as per ELDERS ELETTRICO’s Privacy Policy.\n\nAccess, correction or deletion requests or if you have any questions or concerns about ELDERS ELETTRICO's Privacy Policy or data processing, please contact us [ elderselettrico@gmail.com ].\n\nELDERS ELETTRICO",
                      style: GoogleFonts.montserrat(
                        color: darkGrey50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
