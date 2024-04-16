import 'package:flutter/material.dart';

class DetailScreenItemSettings extends StatelessWidget {
  final Widget menu;
  DetailScreenItemSettings({required this.menu});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu,
    );
  }
}
