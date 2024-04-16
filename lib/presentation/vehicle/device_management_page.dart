import 'dart:io';

import 'package:elderselettricomobile/presentation/common/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/icons.dart';
import '../../domain/model/vehicle.dart';
import '../../core/values/colors.dart';
import '../common/alert_bottom_sheet.dart';
import '../common/text_style.dart';
import '../vehicle_details/vehicle_details_page.dart';
import 'device_management_viewmodel.dart';

class DeviceManagementPage extends ConsumerStatefulWidget {
  DeviceManagementPage({required this.currentDeviceId});

  final String currentDeviceId;

  @override
  ConsumerState<DeviceManagementPage> createState() =>
      _DeviceManagementPageState();
}

class _DeviceManagementPageState extends ConsumerState<DeviceManagementPage> {
  List<String> _selectedItems = [];
  Map<String, dynamic> vehicleUpdate = {};

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.read(deviceManagementViewModel.notifier).getAllVehicle();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleState = ref.watch(deviceManagementViewModel);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, vehicleUpdate);
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: SvgPicture.asset('assets/icons/button_back.svg'),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Device management',
          style: AppTextStyle.title2,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, vehicleUpdate);
          return false;
        },
        child: Container(
          padding: EdgeInsets.only(top: 12),
          child: vehicleState.maybeWhen(
            success: (data) => _buildVehicleList(data),
            orElse: () => Center(
              child: SizedBox(
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
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_selectedItems.isEmpty) return;
            showConfirmationBottomSheet(context,
                title: 'Delete device',
                message:
                    'Are you sure want to delete this device? This action cannot be undone.',
                imagePath: 'assets/images/delete_config_illustration.svg',
                onConfirm: () {
              Navigator.of(context).pop();
              final selectedItems = _selectedItems;
              _selectedItems = [];
              ref
                  .read(deviceManagementViewModel.notifier)
                  .deleteVehicleByIds(selectedItems);
              vehicleUpdate['delete_vehicle'] = true;
            });
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.svg(
                  'trash',
                  height: 20,
                  width: 20,
                  color: _selectedItems.isEmpty ? darkGrey400 : Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Remove device',
                  style: GoogleFonts.montserrat(
                    color: _selectedItems.isEmpty ? darkGrey400 : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleList(List<Vehicle> itemList) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final data = itemList[index];
        return VehicleCard(
          currentDeviceId: widget.currentDeviceId,
          data: data,
          onVehicleUpdated: onVehicleUpdated,
          isSelected: _selectedItems.contains(data.deviceId),
          onCheckedChanged: (checked) => onCheckedChanged(checked, data),
        );
      },
    );
  }

  void onVehicleUpdated(String deviceId) {
    vehicleUpdate['device_id'] = deviceId;
    ref.read(deviceManagementViewModel.notifier).getAllVehicle();
  }

  void onCheckedChanged(bool checked, Vehicle data) {
    final prevSelectedCount = _selectedItems.length;
    if (!checked) {
      if (_selectedItems.contains(data.deviceId)) {
        _selectedItems.remove(data.deviceId);
      }
    } else {
      if (!_selectedItems.contains(data.deviceId)) {
        _selectedItems.add(data.deviceId);
      }
    }

    if (_selectedItems.isEmpty && prevSelectedCount > 0) {
      setState(() {});
    }

    if (!_selectedItems.isEmpty && prevSelectedCount == 0) {
      setState(() {});
    }
  }
}

class VehicleCard extends ConsumerStatefulWidget {
  const VehicleCard({
    required this.currentDeviceId,
    required this.data,
    this.onVehicleUpdated,
    this.onCheckedChanged,
    required this.isSelected,
  });

  final Vehicle data;
  final String currentDeviceId;
  final bool isSelected;
  final void Function(String)? onVehicleUpdated;
  final void Function(bool)? onCheckedChanged;

  @override
  ConsumerState<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends ConsumerState<VehicleCard> {
  var _selected = false;

  @override
  void initState() {
    _selected = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VehicleCard oldWidget) {
    _selected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Vehicle? vehicle = await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return VehicleDetailsPage(
              VehicleDetailData(
                vehicle: widget.data,
              ),
            );
          }),
        );
        if (vehicle != null) {
          widget.onVehicleUpdated?.call(vehicle.deviceId);
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 12),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: darkGrey800,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (widget.data.deviceId == widget.currentDeviceId) return;
                setState(() {
                  _selected = !_selected;
                  widget.onCheckedChanged?.call(_selected);
                });
              },
              child: !_selected
                  ? Icon(
                      Icons.circle_outlined,
                      color: darkGrey500,
                      size: 26,
                    )
                  : SvgPicture.asset(
                      'assets/icons/circle_success_blue.svg',
                      height: 26,
                      width: 26,
                    ),
            ),
            SizedBox(width: 12),
            widget.data.photoPath.isEmpty && widget.data.photoUrl == null
                ? Container(
                    width: 64,
                    height: 64,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Image.asset(
                      'assets/images/vespa3.png',
                    ),
                  )
                : widget.data.photoUrl != null
                    ? CustomNetworkImage(
                        imageUrl: widget.data.photoUrl!,
                        width: 64,
                        height: 64,
                        radius: 13,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.file(
                          File(widget.data.photoPath),
                          fit: BoxFit.cover,
                          width: 64,
                          height: 64,
                        ),
                      ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.vehicleName,
                  style: AppTextStyle.title4,
                ),
                SizedBox(height: 4),
                Text(
                  widget.data.registrationNumber,
                  style: AppTextStyle.subtitle3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
