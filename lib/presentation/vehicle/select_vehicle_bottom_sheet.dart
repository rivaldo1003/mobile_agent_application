import 'dart:io';

import 'package:elderselettricomobile/presentation/bluetooth/viewmodels/battery_viewmodel.dart';
import 'package:elderselettricomobile/presentation/vehicle/device_management_page.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reactive_ble_platform_interface/src/model/connection_state_update.dart';

import '../../core/values/icons.dart';
import '../../domain/model/vehicle.dart';
import '../add_device/add_device_page.dart';
import '../common/custom_network_image.dart';
import '../common/text_style.dart';
import 'vehicle_list_viewmodel.dart';

class SelectVehicle extends StatefulWidget {
  final String currentDeviceId;
  final BatteryViewModel batteryModel;
  final DeviceConnectionState? currentDeviceState;
  final void Function(String)? onVehicleSelected;
  final void Function()? onVehicleDataUpdated;

  SelectVehicle({
    required this.currentDeviceId,
    required this.currentDeviceState,
    this.onVehicleDataUpdated,
    this.onVehicleSelected,
    required this.batteryModel,
  });

  @override
  State<SelectVehicle> createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {
  int selected = 0;

  late DeviceConnectionState currentDeviceState;

  @override
  void initState() {
    currentDeviceState =
        widget.currentDeviceState ?? DeviceConnectionState.connecting;

    Future.delayed(Duration(milliseconds: 100), () {
      context.read<VehicleListViewModel>().getAllVehicle();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleListState = context.watch<VehicleListViewModel>().state;

    return Container(
      height: 520,
      padding: EdgeInsets.only(
        top: 8,
        bottom: 8,
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
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select your vehicle',
                        style: AppTextStyle.title2,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Make sure the vehicle is connected.',
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                          color: darkGrey200,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Material(
                  color: darkGrey900,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () async {
                      Map<String, dynamic> vehicleUpdate =
                          await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return ProviderScope(
                            child: DeviceManagementPage(
                              currentDeviceId: widget.currentDeviceId,
                            ),
                          );
                        }),
                      );

                      if (vehicleUpdate.isEmpty) return;

                      context.read<VehicleListViewModel>().getAllVehicle();

                      final updatedDeviceId = vehicleUpdate['device_id'];
                      if (updatedDeviceId != null) {
                        if (updatedDeviceId == widget.currentDeviceId) {
                          widget.onVehicleDataUpdated?.call();
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: SvgPicture.asset('assets/icons/sort_down.svg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          vehicleListState.maybeWhen(
            success: (data) {
              final connectedIndex = data.indexWhere(
                  (element) => element.deviceId == widget.currentDeviceId);
              if (connectedIndex != -1) {
                setState(() {
                  selected = connectedIndex;
                });
              }
              return _buildVehicleList(data);
            },
            orElse: () => Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Divider(
            color: darkGrey600,
            height: 1,
          ),
          _buildAddVehicleButton(),
        ],
      ),
    );
  }

  Widget _buildAddVehicleButton() {
    return Material(
      color: darkGrey900,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDevicePage(isFromVehicleHome: true),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Add vehicle',
                style: AppTextStyle.title2,
              ),
              Spacer(),
              AppIcons.svg(
                'chevron_right',
                color: darkGrey200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleList(List<Vehicle> itemList) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CardVehicles(index: index, vehicle: itemList[index]);
        },
      ),
    );
  }

  Widget CardVehicles({
    required final int index,
    required final Vehicle vehicle,
  }) {
    return InkWell(
      onTap: () {
        if (vehicle.deviceId != widget.currentDeviceId) {
          widget.onVehicleSelected?.call(vehicle.deviceId);
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: 286,
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 0,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: (selected == index)
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : darkGrey800,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: (selected == index)
                ? Theme.of(context).primaryColor
                : darkGrey800,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.svg(
                        'dot',
                        color: Colors.white,
                      ),
                      SizedBox(width: 6),
                      Text(
                        (selected == index)
                            ? currentDeviceState.name.toUpperCase()
                            : DeviceConnectionState.disconnected.name
                                .toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: (selected == index &&
                            currentDeviceState ==
                                DeviceConnectionState.connected)
                        ? Theme.of(context).primaryColor
                        : darkGrey600,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: (selected == index)
                      ? SvgPicture.asset('assets/icons/connect.svg')
                      : null,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                vehicle.vehicleName,
                style: AppTextStyle.title2,
              ),
            ),
            SizedBox(height: 18),
            Center(
              child: vehicle.photoPath.isEmpty && vehicle.photoUrl == null
                  ? Image.asset(
                      'assets/images/vespa3.png',
                      height: 160,
                      width: 160,
                    )
                  : vehicle.photoUrl != null
                      ? CustomNetworkImage(
                          imageUrl: vehicle.photoUrl!,
                          width: 180,
                          height: 160,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(vehicle.photoPath),
                            fit: BoxFit.cover,
                            width: 180,
                            height: 160,
                          ),
                        ),
            ),
            SizedBox(height: 10),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                left: 12,
                top: 0,
                right: 12,
                bottom: 12,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/battery_horizontal.svg',
                            height: 22,
                            width: 22,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: selected == index
                                        ? widget.batteryModel
                                            .getBatteryPercentage()
                                        : '--',
                                    style: GoogleFonts.montserrat(
                                      color: textColorBlack,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' %',
                                        style: GoogleFonts.montserrat(
                                          color: textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Charge Left',
                                style: GoogleFonts.montserrat(
                                  color: darkGrey500,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/map_range.svg',
                            height: 22,
                            width: 22,
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: selected == index
                                        ? widget.batteryModel.getEstRange()
                                        : '--',
                                    style: GoogleFonts.montserrat(
                                      color: textColorBlack,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' km',
                                        style: GoogleFonts.montserrat(
                                          color: textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Est. Range',
                                style: GoogleFonts.montserrat(
                                  color: darkGrey500,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
