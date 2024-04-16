import 'package:elderselettricomobile/presentation/setting/settings_page.dart';
import 'package:flutter/material.dart';
import '../common/custom_bottom_navigation.dart';
import '../maps/map_screen.dart';
import 'home_add_vehicle.dart';

class MainBottomNavigationPage extends StatefulWidget {
  @override
  State<MainBottomNavigationPage> createState() =>
      _MainBottomNavigationPageState();
}

class _MainBottomNavigationPageState extends State<MainBottomNavigationPage> {
  int selected = 0;

  void selectedItem(int index) {
    setState(() {
      selected = index;
    });
  }

  List<Widget> _listBody = [
    Home(),
    MapScreen(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listBody.elementAt(selected),
      bottomNavigationBar: MainBottomNavigation(
        selected: selected,
        onTap: selectedItem,
      ),
    );
  }
}
