import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/text_style.dart';

class SoundItem extends StatefulWidget {
  final int id;
  SoundItem({required this.id});
  @override
  State<SoundItem> createState() => _SoundItemState();
}

class _SoundItemState extends State<SoundItem> {
  final Map<int, Widget> body = {
    0: Text(
      'OFF',
      style: AppTextStyle.segmentedControlLabel,
    ),
    1: Text(
      'ON',
      style: AppTextStyle.segmentedControlLabel,
    ),
  };

  int groupValueSound = 1;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('groupValueSound', groupValueSound);
  }

  Future<int> loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("groupValueSound") ?? 0;
  }

  @override
  void initState() {
    super.initState();
    loadData().then((d) {
      groupValueSound = d;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        leadingWidth: 34,
        elevation: 0,
        backgroundColor: Color(0xffF4F5F7),
        title: Text(
          'Sound',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: textColorBlack,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // setState(() {
              //   isON = false;
              //   _currentSliderValue = 0;
              // });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/reset.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Reset',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 24,
            color: Colors.white,
          ),
          Container(
            height: 48,
            color: Colors.white,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sound',
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CupertinoSlidingSegmentedControl<int>(
                  children: body,
                  thumbColor: Color(0xffA69875),
                  onValueChanged: (newGroupValue) {
                    setState(() {
                      groupValueSound = newGroupValue!;
                    });
                  },
                  groupValue: groupValueSound,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 8,
              right: 16,
              bottom: 0,
            ),
            child: Text(
              'To change the configuration, select between the options.',
              style: GoogleFonts.montserrat(
                color: greyFont,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 16,
                    color: Colors.white,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Divider(
                          color: Color(0xffE4E7EC),
                          endIndent: 0,
                          indent: 0,
                          thickness: 1,
                        ),
                        SizedBox(height: 16),
                        Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0xffA69875),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                saveData();
                                loadData().then((value) {
                                  groupValueSound = value;
                                  setState(() {});
                                });
                                Navigator.of(context).pop(groupValueSound);
                              },
                              borderRadius: BorderRadius.circular(24),
                              splashColor: Colors.grey,
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
