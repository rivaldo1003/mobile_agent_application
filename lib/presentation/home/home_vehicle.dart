import 'package:elderselettricomobile/domain/model/mcu.dart';
import 'package:flutter/material.dart';

import '../../core/utils/mcu_util.dart';
import '../common/item_specifications.dart';

class HomeVehiclePage extends StatefulWidget {
  const HomeVehiclePage({super.key});

  @override
  State<HomeVehiclePage> createState() => _HomeVehiclePageState();
}

class _HomeVehiclePageState extends State<HomeVehiclePage> {
  @override
  Widget build(BuildContext context) {
    final dataValue = McuData801(
      dataLength: 6,
      dataValue: [],
      values: {
        McuValue.speed: 20,
        McuValue.battVoltage: 60,
        McuValue.battCurrent: 60,
        McuValue.tripDistance: 10,
        McuValue.temp: 60,
        McuValue.mode: 1,
      },
    );

    final values = dataValue.values.values.toList();
    final keys = dataValue.values.keys.toList();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 16),
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: values.length,
            itemBuilder: (_, index) => ItemSpecifications(
                  image: keys[index].icon,
                  titleItem: keys[index].label,
                  valueItem: values[index],
                  format: keys[index].unit,
                )),
      ),
    );
  }
}

class TelemetryObject {
  McuValue key;
  dynamic value;

  TelemetryObject({required this.key, required this.value});
}

extension McuValeuExt on McuValue {
  String get icon {
    switch (this) {
      case McuValue.battVoltage:
        return 'assets/icons/battery_voltage.png';
      case McuValue.battCurrent:
        return 'assets/icons/battery_voltage.png';
      case McuValue.temp:
        return 'assets/icons/temp.png';
      case McuValue.tripDistance:
        return 'assets/icons/trip_distance.png';
      case McuValue.status:
        return '';
      case McuValue.mode:
        return 'assets/icons/mode.png';
      case McuValue.avs:
        return '';
      case McuValue.mxs:
        return '';
      case McuValue.speed:
        return 'assets/icons/speed.png';
      case McuValue.breaking:
        return '';
      case McuValue.rpm:
        return '';
    }
  }

  String get label {
    switch (this) {
      case McuValue.battVoltage:
        return 'Batt. Voltage';
      case McuValue.battCurrent:
        return 'Batt. Current';
      case McuValue.temp:
        return 'Temperature';
      case McuValue.tripDistance:
        return 'Trip Distance';
      case McuValue.status:
        return 'Status';
      case McuValue.mode:
        return 'Mode';
      case McuValue.avs:
        return '';
      case McuValue.mxs:
        return '';
      case McuValue.speed:
        return 'Speed';
      case McuValue.breaking:
        return '';
      case McuValue.rpm:
        return '';
    }
  }

  String get unit {
    switch (this) {
      case McuValue.battVoltage:
        return 'V';
      case McuValue.battCurrent:
        return 'A';
      case McuValue.temp:
        return '°C';
      case McuValue.tripDistance:
        return 'km';
      case McuValue.status:
        return '';
      case McuValue.mode:
        return '';
      case McuValue.avs:
        return '';
      case McuValue.mxs:
        return '';
      case McuValue.speed:
        return 'km/h';
      case McuValue.breaking:
        return '';
      case McuValue.rpm:
        return '';
    }
  }
}
