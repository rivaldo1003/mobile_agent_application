import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:elderselettricomobile/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BluetoothOffScreen extends StatelessWidget {
  BluetoothOffScreen({required this.state});

  final BleStatus? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcons.svg(
              'bluetooth_disconnected',
              height: 200,
              width: 200,
              color: Colors.white,
            ),
            SizedBox(height: 32),
            Text(
              'Bluetooth Adapter is ${state != null ? state!.displayName : BleStatus.unknown}.',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
