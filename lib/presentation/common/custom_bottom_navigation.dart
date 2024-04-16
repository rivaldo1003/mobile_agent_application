import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({required this.selected, this.onTap});

  final int selected;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: darkGrey900,
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: (selected == 0)
                ? SvgPicture.asset(
                    'assets/icons/dual_tone/home.svg',
                  )
                : SvgPicture.asset('assets/icons/linear/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: (selected == 1)
                ? SvgPicture.asset(
                    'assets/icons/dual_tone/map.svg',
                  )
                : SvgPicture.asset('assets/icons/linear/map.svg'),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: (selected == 2)
                ? SvgPicture.asset(
                    'assets/icons/dual_tone/menu.svg',
                  )
                : SvgPicture.asset('assets/icons/linear/menu.svg'),
            label: 'More',
          ),
        ],
        unselectedLabelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
        ),
        selectedLabelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
        ),
        unselectedFontSize: 11,
        selectedFontSize: 11,
        selectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: onTap,
        unselectedItemColor: Colors.grey,
        backgroundColor: surfaceColor,
      ),
    );
  }
}
