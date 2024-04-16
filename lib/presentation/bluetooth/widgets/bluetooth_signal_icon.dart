import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

class BluetoothSignalIcon extends StatelessWidget {
  const BluetoothSignalIcon({required this.rssi});

  final int rssi;

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionStateUpdate>(
      builder: (_, connectionStateUpdate, __) {
        var iconPath = "";
        if (rssi <= -100) {
          iconPath = 'assets/icons/bluetooth_signal_1.svg';
        } else if (rssi < -70 && rssi > -100) {
          iconPath = 'assets/icons/bluetooth_signal_2.svg';
        } else {
          iconPath = 'assets/icons/bluetooth_signal_3.svg';
        }
        if (connectionStateUpdate.connectionState ==
            DeviceConnectionState.disconnected) {
          iconPath = 'assets/icons/bluetooth_disconnected.svg';
        }

        return SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
        );
      },
    );
  }
}
