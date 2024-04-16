import 'dart:async';

import 'package:elderselettricomobile/domain/mapper/mcu_mapper.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/core/utils/mcu_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/model/mcu.dart';
import '../../common/item_specifications.dart';

class AllView extends StatefulWidget {
  final QualifiedCharacteristic characteristic;
  final DeviceConnectionState? connectionState;
  final McuObject? mcuObject;
  final bool isMotorOn;

  AllView({
    required this.characteristic,
    this.connectionState,
    this.mcuObject,
    required this.isMotorOn,
  });

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  final _ble = FlutterReactiveBle();
  late DeviceConnectionState? _connectionState;
  StreamSubscription<List<int>>? _subscribeStream;
  StreamSubscription<ConnectionStateUpdate>? _connectionStream;

  var _isDisconnected = false;

  int? dataLength = null;
  double? speed = null;
  int? battVoltage = null;
  int? battCurrent = null;
  double? tripDistance = null;
  int? temp = null;
  int? status = null;
  String? mode = null;
  double? mxs = null;
  double? avs = null;
  int? breaking = null;
  int? rpm = null;
  bool isMotorOn = true;

  @override
  void initState() {
    isMotorOn = widget.isMotorOn;
    _connectionState = widget.connectionState;
    if (_connectionState == DeviceConnectionState.connected) {
      Future.delayed(const Duration(milliseconds: 200), () async {
        _subscribeToCharacteristic();
      });
    } else {
      if (_connectionState == DeviceConnectionState.disconnected)
        _isDisconnected = true;
      if (widget.mcuObject != null &&
          widget.mcuObject?.data is McuTelemetryData) {
        _parseDataValue(widget.mcuObject?.data?.toTelemetry());
      }
    }
    _startConnectedDeviceStream();
    super.initState();
  }

  void _startConnectedDeviceStream() {
    _connectionStream = _ble.connectedDeviceStream.listen((event) {
      if (event.deviceId != widget.characteristic.deviceId) return;
      _connectionState = event.connectionState;
      if (event.connectionState == DeviceConnectionState.connected) {
        if (_isDisconnected) {
          setState(() {
            _isDisconnected = false;
          });
        }

        if (_subscribeStream != null) {
          _subscribeStream?.cancel().whenComplete(() {
            _subscribeToCharacteristic();
          });
        } else {
          _subscribeToCharacteristic();

          if (!_isDisconnected) {
            setState(() {
              _isDisconnected = true;
            });
          }
        }
      }
    });
  }

  void _subscribeToCharacteristic() {
    _subscribeStream =
        _ble.subscribeToCharacteristic(widget.characteristic).listen((event) {
      _onCharacteristicValueChanged(event);
    });
  }

  void _onCharacteristicValueChanged(List<int> event) {
    try {
      final mcuObject = parseCharacteristicValue(event);
      if (mcuObject.packageId == 803) {
        setMotorOn(mcuObject.data?.to803());
        return;
      }

      if (mcuObject.data is McuTelemetryData) {
        _parseDataValue(mcuObject.data?.toTelemetry());
      }
    } catch (e) {}
  }

  void setMotorOn(McuData803? data) {
    if (data == null) return;
    final isMotorOn = data.vehicleOn || data.controllerStatus;
    if (isMotorOn != this.isMotorOn) {
      this.isMotorOn = isMotorOn;
      setState(() {});
    }
  }

  void _parseDataValue(McuTelemetryData? data) {
    if (!mounted) return;
    if (data == null) return;

    dataLength = data.dataLength;
    battVoltage = data.values[McuValue.battVoltage];
    battCurrent = data.values[McuValue.battVoltage];
    temp = data.values[McuValue.temp];
    tripDistance = data.values[McuValue.tripDistance];
    status = data.values[McuValue.status];
    mode = data.values[McuValue.mode];
    avs = data.values[McuValue.avs];
    mxs = data.values[McuValue.mxs];
    breaking = data.values[McuValue.breaking];
    rpm = data.values[McuValue.rpm];
    speed = data.values[McuValue.speed];

    setState(() {});
  }

  @override
  void dispose() {
    _subscribeStream?.cancel();
    _connectionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          color: darkGrey900,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(14),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset('assets/icons/handle.svg'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Telemetry data',
                        style: AppTextStyle.title2,
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/speed_grey.svg'
                                : 'assets/icons/speed.png',
                            titleItem: 'Speed',
                            valueItem: speed == null ? '--' : speed!.toInt(),
                            format: 'km/h',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/battery_voltage_grey.svg'
                                : 'assets/icons/battery_voltage.png',
                            titleItem: 'Batt. Voltage',
                            valueItem: battVoltage == null ? '--' : battVoltage,
                            format: 'V',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/battery_voltage_grey.svg'
                                : 'assets/icons/battery_voltage.png',
                            titleItem: 'Batt. Current',
                            valueItem: battCurrent == null ? '--' : battCurrent,
                            format: 'A',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/trip_distance_grey.svg'
                                : 'assets/icons/trip_distance.png',
                            titleItem: 'Trip Distance',
                            valueItem:
                                tripDistance == null ? '--' : tripDistance,
                            format: 'km',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/temperature_grey.svg'
                                : 'assets/icons/temp.png',
                            titleItem: 'Temperature',
                            valueItem: temp == null ? '--' : temp,
                            format: '°C',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/mode_grey.svg'
                                : 'assets/icons/mode.png',
                            titleItem: 'Mode',
                            valueItem: mode == null ? '--' : mode!,
                            format: '',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/status_grey.svg'
                                : 'assets/icons/status.png',
                            titleItem: 'Status',
                            valueItem: status == null
                                ? '--'
                                : status == 0
                                    ? DeviceStatus.sensorless.text
                                    : status == 1
                                        ? DeviceStatus.hallSensor.text
                                        : '',
                            format: '',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/speed_grey.svg'
                                : 'assets/icons/speed.png',
                            titleItem: 'MXS',
                            valueItem: mxs == null ? '--' : mxs!.toInt(),
                            format: 'km/h',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/speed_grey.svg'
                                : 'assets/icons/speed.png',
                            titleItem: 'AVS',
                            valueItem: avs == null ? '--' : avs,
                            format: 'km/h',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/rpm_grey.svg'
                                : 'assets/icons/rpm.png',
                            titleItem: 'Motor RPM',
                            valueItem: rpm == null ? '--' : rpm,
                            format: 'rpm',
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Fault condition',
                        style: AppTextStyle.title2,
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/battery_voltage_grey.svg'
                                : 'assets/icons/battery_voltage.png',
                            titleItem: 'Over Current',
                            valueItem: battCurrent == null ||
                                    isDataNotValid() ||
                                    dataLength == 0
                                ? '--'
                                : battCurrent! <= 100
                                    ? FaultCondition.normal.name
                                    : FaultCondition.abnormal.name,
                            format: '',
                            isDisabled: _isDisconnected,
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/battery_voltage_grey.svg'
                                : 'assets/icons/battery_voltage.png',
                            titleItem: 'Under Voltage',
                            valueItem: battVoltage == null ||
                                    isDataNotValid() ||
                                    dataLength == 0
                                ? '--'
                                : battVoltage! > 45
                                    ? FaultCondition.normal.name
                                    : FaultCondition.abnormal.name,
                            format: '',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/status_grey.svg'
                                : 'assets/icons/status.png',
                            titleItem: 'Hall Failure',
                            valueItem: status == null ||
                                    isDataNotValid() ||
                                    dataLength == 0
                                ? '--'
                                : status == 1
                                    ? FaultCondition.normal.name
                                    : FaultCondition.abnormal.name,
                            format: '',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/temperature_grey.svg'
                                : 'assets/icons/temp.png',
                            titleItem: 'Over Temp.',
                            valueItem: temp == null ||
                                    isDataNotValid() ||
                                    dataLength == 0
                                ? '--'
                                : (temp! >= -30 || temp! <= 100)
                                    ? FaultCondition.normal.name
                                    : FaultCondition.abnormal.name,
                            format: '',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/protection_grey.svg'
                                : 'assets/icons/voltage_protection.png',
                            titleItem: 'Protection',
                            valueItem: battVoltage == null ||
                                    isDataNotValid() ||
                                    dataLength == 0
                                ? '--'
                                : (battVoltage! <= 144)
                                    ? FaultCondition.normal.name
                                    : FaultCondition.abnormal.name,
                            format: '',
                          ),
                          ItemSpecifications(
                            image: isDataNotValid()
                                ? 'assets/icons/breaking_grey.svg'
                                : 'assets/icons/breaking_state.png',
                            titleItem: 'Breaking State',
                            valueItem: breaking == null ||
                                    isDataNotValid() ||
                                    dataLength == 0
                                ? '--'
                                : breaking == 0
                                    ? FaultCondition.normal.name
                                    : FaultCondition.abnormal.name,
                            format: '',
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isDataNotValid() => _isDisconnected || isMotorOn == false;
}
