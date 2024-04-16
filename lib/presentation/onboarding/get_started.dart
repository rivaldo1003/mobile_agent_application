import 'dart:io';

import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../setting/privacy_and_policy.dart';
import '../setting/term_and_conditions.dart';
import '../sign_in/sign_in_page.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  'email',
]);

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    _init();
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
    print(Platform.isAndroid
        ? '1006171488629-j39h5qg1rjvo47g54vif3dosngre0eqm.apps.googleusercontent.com'
        : Platform.isIOS
            ? '1006171488629-up2qb6bjrqadtlnsv98cji3bel1t5uhb.apps.googleusercontent.com'
            : '');
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/dark_bg.png'),
                fit: BoxFit.cover,
              )),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 3.4,
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: SvgPicture.asset('assets/icons/logo_elders.svg'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 0,
                  bottom: 40,
                  right: 16,
                ),
                // height: MediaQuery.of(context).size.height / 2.9,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terms & Conditions',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 16),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'By signing up you accept to the Elders Elettrico’s ',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms of Service ',
                              style: GoogleFonts.montserrat(
                                color: brownColor,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return TermAndConditions();
                                      },
                                    ),
                                  );
                                },
                            ),
                            TextSpan(
                              text: 'and ',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy. ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: brownColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PrivacyPolicy();
                                      },
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 56,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xffA69875),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignInPage();
                                  },
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(24),
                            splashColor: Colors.grey,
                            child: Center(
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        child: Text(
                          'v ${_versionName}',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildOptionsSignIn extends StatelessWidget {
  final String img;

  BuildOptionsSignIn({
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      // color: Colors.grey,
      child: SvgPicture.asset(img),
    );
  }
}
