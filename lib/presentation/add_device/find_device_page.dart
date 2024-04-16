import 'dart:io';

import 'package:elderselettricomobile/presentation/add_device/widgets/scan_result_tile.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../core/ble/ble_scanner.dart';
import '../common/text_style.dart';
import 'viewmodels/device_connect_viewmodel.dart';

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({
    required this.isFromVehicleHome,
  });

  final bool isFromVehicleHome;

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen>
    with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  AnimationController? controller;

  late void Function(List<Uuid>) startScan;
  late VoidCallback stopScan;
  Iterable<DiscoveredDevice> _discoveredDevices = [];

  @override
  void initState() {
    startScan = context.read<BleScanner>().startScan;
    stopScan = context.read<BleScanner>().stopScan;

    _requestPermission();
    _startScanning();
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.linear);
    animation = ColorTween(
            begin: Color(
              0xff636266,
            ),
            end: Colors.grey[100])
        .animate(curve);

    animation!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
        setState(() {});
      },
    );
    controller!.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    stopScan();
    super.dispose();
  }

  Future<void> _requestPermission() async {
    if (Platform.isAndroid) {
      await [
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
        Permission.location,
      ].request();
    }
  }

  void _startScanning() {
    startScan([]);
    Future.delayed(Duration(seconds: 4), () {
      _stopScanning();
    });
  }

  void _stopScanning() {
    stopScan();
  }

  double heightCont = 296;
  double widthCont = 296;

  @override
  Widget build(BuildContext context) {
    var scannerState = context.watch<BleScannerState?>() ??
        BleScannerState(
          discoveredDevices: [],
          scanIsInProgress: false,
        );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: SvgPicture.asset(
              'assets/icons/button_back.svg',
            ),
          ),
        ),
        title: Text(
          'Add new device',
          style: AppTextStyle.title2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(24),
                      height: MediaQuery.of(context).size.height * 0.390,
                      width: MediaQuery.of(context).size.width,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 2900),
                        height: heightCont,
                        width: widthCont,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: animation!.value!,
                            width: 2,
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 2400),
                          height: 232,
                          width: 232,
                          margin: EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: animation!.value!,
                              width: 2,
                            ),
                          ),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1900),
                            height: 232,
                            width: 232,
                            margin: EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: animation!.value!,
                                width: 2,
                              ),
                            ),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 232,
                              width: 232,
                              margin: EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: animation!.value!,
                                  width: 2,
                                ),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 900),
                                height: 232,
                                width: 232,
                                margin: EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: animation!.value!,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.bluetooth,
                                  color: darkGrey900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Container(
                    height: 50,
                    color: darkGrey900.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 40,
                  child: Container(
                    height: 50,
                    color: darkGrey900.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 65,
                  child: Container(
                    height: 70,
                    color: darkGrey900.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -35,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    padding: EdgeInsets.only(left: 12),
                    height: 64,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: darkGrey800,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: IconButton(
                            icon: scannerState.scanIsInProgress
                                ? SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      if (!scannerState.scanIsInProgress) {
                                        _startScanning();
                                      }
                                    },
                                    child: Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                    ),
                                  ),
                            onPressed: () {},
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      'Searching for nearby devices. Make sure your device has entered ',
                                  style: AppTextStyle.subtitle4,
                                  children: [
                                    TextSpan(
                                      text: 'pairing mode.',
                                      style: AppTextStyle.subtitle4,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            _buildMcuContainer(scannerState),
          ],
        ),
      ),
    );
  }

  Widget _buildMcuContainer(BleScannerState scannerState) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 16,
            top: 28,
            right: 16,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
            ),
            color: darkGrey900,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect MCUs',
                        style: AppTextStyle.title2,
                      ),
                      Text(
                        'Please select one of these MCUs',
                        style: AppTextStyle.subtitle2,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              _buildMcuList(scannerState),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMcuList(BleScannerState scannerState) {
    _discoveredDevices =
        scannerState.discoveredDevices.where((d) => d.name.contains('VIXMO'));

    return ChangeNotifierProvider(
      create: (_) => DeviceConnectViewModel(),
      child: Column(
        children: _discoveredDevices
            .map(
              (device) => ScanResultTile(
                device: device,
                isFromVehicleHome: widget.isFromVehicleHome,
              ),
            )
            .toList(),
      ),
    );
  }
}
