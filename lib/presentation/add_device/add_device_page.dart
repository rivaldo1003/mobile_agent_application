import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';

import 'bluetooth_off_screen.dart';
import 'find_device_page.dart';

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({this.isFromVehicleHome = false});

  final bool isFromVehicleHome;

  @override
  Widget build(BuildContext context) {
    return Consumer<BleStatus?>(
      builder: (_, status, __) {
        if (status == BleStatus.ready) {
          return FindDevicesScreen(
            isFromVehicleHome: isFromVehicleHome,
          );
        } else {
          return BluetoothOffScreen(state: status);
        }
      },
    );
  }
}
