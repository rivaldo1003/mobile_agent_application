import 'package:elderselettricomobile/presentation/add_device/add_device_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/vespa2.png',
                width: 246,
                height: 140,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'No custom ride',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Material(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return AddDevicePage();
                      }),
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/plus.svg',
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Add vehicle',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
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
