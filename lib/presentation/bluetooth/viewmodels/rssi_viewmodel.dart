import 'dart:async';

import 'package:elderselettricomobile/core/base/base_view_model.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class RssiViewModel extends StateViewModel<int> {
  RssiViewModel(this.deviceId) : super(0);

  final String deviceId;
  StreamSubscription<int>? rssiStreamSub;
  final _ble = FlutterReactiveBle();

  void setupRssiStream() {
    if (rssiStreamSub == null) {
      startRssiStream();
    } else {
      rssiStreamSub?.cancel();
      startRssiStream();
    }
  }

  void startRssiStream() {
    rssiStreamSub = _ble.streamRssi(deviceId).listen((rssi) {
      state = rssi;
    });
  }

  Future<void>? cancelStream() {
    return rssiStreamSub?.cancel();
  }

  @override
  void dispose() {
    rssiStreamSub?.cancel();
    super.dispose();
  }
}
