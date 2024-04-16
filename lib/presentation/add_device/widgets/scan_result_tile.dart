import 'package:elderselettricomobile/core/values/icons.dart';
import 'package:elderselettricomobile/domain/model/mcu_connect.dart';
import 'package:elderselettricomobile/presentation/common/alert_snackbar.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/ble/ble_device_connector.dart';
import '../../bluetooth/device_screen.dart';
import '../../vehicle_details/vehicle_details_page.dart';
import '../viewmodels/device_connect_viewmodel.dart';

class ScanResultTile extends StatelessWidget {
  ScanResultTile({
    required this.device,
    required this.isFromVehicleHome,
  });

  final DiscoveredDevice device;
  final bool isFromVehicleHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Material(
        color: darkGrey800,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            _onConnectDevice(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.only(
              top: 12,
              bottom: 12,
            ),
            child: ListTile(
              title: _buildTitle(context),
              horizontalTitleGap: 0,
              leading: Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkGrey900,
                ),
                child: Icon(
                  Icons.bluetooth,
                  color: Colors.white,
                ),
              ),
              trailing: !context.watch<DeviceConnectViewModel>().state.isLoading
                  ? AppIcons.svg(
                      'chevron_right',
                      color: darkGrey300,
                    )
                  : SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          device.name,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          device.id.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 13,
            color: darkGrey200,
          ),
        )
      ],
    );
  }

  Future<void> _onConnectDevice(BuildContext context) async {
    final result = await context
        .read<DeviceConnectViewModel>()
        .connectMCU(device.id, device.name);
    result.maybeWhen(
      success: (data) => _onSuccessCheckConnect(data, context),
      error: (e) => _showErrorMessage(message: e.toString()),
      orElse: () {},
    );
  }

  Future<void> _onSuccessCheckConnect(
      McuConnect data, BuildContext context) async {
    final vehicle = data.vehicle;
    if (vehicle == null) context.read<BleDeviceConnector>().connect(device.id);

    if (isFromVehicleHome && vehicle != null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return DeviceScreen(deviceId: device.id);
        },
      ), (route) => false);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return vehicle == null
                ? VehicleDetailsPage(
                    VehicleDetailData(
                      serverDeviceId: data.deviceId,
                      device: device,
                      isFromVehicleHome: isFromVehicleHome,
                    ),
                  )
                : DeviceScreen(deviceId: device.id);
          },
        ),
      );
    }
  }

  void _showErrorMessage({String title = 'Error', required String message}) {
    showErrorSnackBar(title, message);
  }
}
