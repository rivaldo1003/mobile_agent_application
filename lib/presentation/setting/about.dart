import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
          'About',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              height: 162,
              child: Center(
                child: Image.asset('assets/images/about_us.png'),
              ),
            ),
            Container(
              child: Text(
                'Go Green with Us!',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Under the umbrella of PT. Roda Elektrik Asia as a holding company, Elders Elettrico’s vision is to be an electric conversion company with the largest network & partnership system in Asia. Elders Elettrico is the first plug and play Electric Conversion product in Indonesia. Designed by Elders Garage, established since 2013 and received certification as a garage for conversion in 2021.\n\n"
                    "Our Electric Conversion Workshops in Jakarta, Bali, Bandung, Bogor & Medan are staffed with passionate and specialized mechanics and engineers that will make sure your bike is safely and beautifully converted.",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Get in touch with us to book an appointment to electrify your classic Vespa.",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Elders Elettrico",
                    style: AppTextStyle.title4,
                  ),
                  Text(
                    "JL. Gatot Subroto No. kav 94 RT 11 / RW 3. Pancoran Kecamatan Pancoran Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12780",
                    style: AppTextStyle.subtitle3,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: darkGrey600,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Detail",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    color: darkGrey500,
                    endIndent: 0,
                    indent: 0,
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Telp: (+62) 812 9534 3497\nEmail: elderselettrico@gmail.com",
                    style: AppTextStyle.subtitle3,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "© Elders Elettrico.",
                        style: AppTextStyle.subtitle4,
                      ),
                      Text(
                        "All rights reserved",
                        style: AppTextStyle.subtitle4,
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      _launchUrl(Uri.parse('https://www.instagram.com/elderselettrico'));
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset('assets/icons/instagram.svg'),
                    ),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      _launchUrl(Uri.parse('https://www.facebook.com/elderselettrico'));
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset('assets/icons/facebook_dark.svg'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
