import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:elderselettricomobile/domain/model/battery.dart';
import 'package:elderselettricomobile/presentation/common/custom_network_image.dart';
import 'package:elderselettricomobile/presentation/vehicle_details/vehicle_details_viewmodel.dart';
import 'package:elderselettricomobile/presentation/common/alert_bottom_sheet.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/model/vehicle.dart';

import '../bluetooth/device_screen.dart';
import '../common/general_option_tile.dart';
import '../form/date_form.dart';
import '../form/text_field_form.dart';

class VehicleDetailsPage extends StatelessWidget {
  const VehicleDetailsPage(this.detail);

  final VehicleDetailData detail;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _VehicleDetailsPage(
        detail: detail,
      ),
    );
  }
}

class _VehicleDetailsPage extends ConsumerStatefulWidget {
  const _VehicleDetailsPage({required this.detail});

  final VehicleDetailData detail;

  @override
  ConsumerState<_VehicleDetailsPage> createState() =>
      _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends ConsumerState<_VehicleDetailsPage> {
  void _onSuccessAddVehicle(Vehicle addedVehicle) {
    showSuccessModalBottomSheet(context,
        message:
            'Your vehicle has been ${_isUpdateVehicle ? 'updated' : 'added'} successfully',
        onConfirm: () {
      Navigator.pop(context);
    }, onCompleted: () {
      if (widget.detail.vehicle != null) {
        Navigator.pop(context, addedVehicle);
        return;
      }

      if (widget.detail.device == null) return;
      if (widget.detail.isFromVehicleHome) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return DeviceScreen(deviceId: widget.detail.device!.id);
        }), (route) => false);
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return DeviceScreen(deviceId: widget.detail.device!.id);
          }),
        );
      }
    });
  }

  XFile? image;
  Vehicle? vehicle;
  String? _imagePath = null;
  String? _imageUrl = null;
  final ImagePicker picker = ImagePicker();
  final _vehicleNameController = TextEditingController();
  final _registrationController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _colorController = TextEditingController();
  final _dateController = TextEditingController();
  var _submitted = false;
  var _isUpdateVehicle = false;
  var _selectedBattery = BatteryType.none;

  @override
  void initState() {
    if (widget.detail.vehicle != null) {
      _isUpdateVehicle = true;
      final vehicle = widget.detail.vehicle!;
      this.vehicle = vehicle;
      getSelectedBattery();
      _imagePath = vehicle.photoPath;
      _imageUrl = vehicle.photoUrl;
      _vehicleNameController.text = vehicle.vehicleName;
      _registrationController.text = vehicle.registrationNumber;
      _modelController.text = vehicle.model;
      _yearController.text = vehicle.year;
      _colorController.text = vehicle.color;
      _dateController.text = vehicle.purchaseDate;
    }
    super.initState();
  }

  Future<void> getSelectedBattery() async {
    final pref = await SharedPreferences.getInstance();
    final selectedBattery =
        pref.getString('selectedBattery_${vehicle!.deviceId}');
    if (selectedBattery == null) return;
    final batteryType =
        BatteryType.values.firstWhereOrNull((b) => b.text == selectedBattery);
    if (batteryType == null) return;
    setState(() {
      _selectedBattery = batteryType;
    });
  }

  Future getImage(ImageSource media) async {
    var img =
        await picker.pickImage(source: media, maxHeight: 600, maxWidth: 800);
    setState(() {
      image = img;
    });
  }

  void showMediaOptionDialog() {
    showRoundedBottomSheet(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: darkGrey900,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset('assets/icons/handle.svg'),
                ),
                SizedBox(height: 8),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    'Add photo',
                    style: AppTextStyle.title3,
                  ),
                ),
                SizedBox(height: 8),
                GeneralOptionTile(
                  label: 'Take a photo',
                  iconPath: 'assets/icons/camera.svg',
                  onTap: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                ),
                GeneralOptionTile(
                  label: 'Upload from Photos',
                  iconPath: 'assets/icons/image.svg',
                  onTap: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light,
    ));

    ref.listen(vehicleDetailsViewModel, (_, state) {
      state.maybeWhen(
          success: (vehicle) {
            _onSuccessAddVehicle(vehicle);
          },
          error: (e) {
            showErrorModalBottomSheet(
              context,
              title: "Can't ${_isUpdateVehicle ? 'update' : 'add'} vehicle",
              message: e.toString(),
            );
          },
          orElse: () {});
    });

    final vehicleState = ref.watch(vehicleDetailsViewModel);

    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Vehicle details',
          style: AppTextStyle.title2,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image != null ||
                      (_imagePath != null && _imagePath?.isNotEmpty == true)
                  ? GestureDetector(
                      onTap: showMediaOptionDialog,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(image != null ? image!.path : _imagePath!),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                        ),
                      ),
                    )
                  : _imageUrl != null
                      ? GestureDetector(
                          onTap: showMediaOptionDialog,
                          child: CustomNetworkImage(
                            imageUrl: _imageUrl!,
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                          ),
                        )
                      : GestureDetector(
                          onTap: showMediaOptionDialog,
                          child: DottedBorder(
                            color: darkGrey600,
                            dashPattern: [8, 6],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(15),
                            child: Container(
                              alignment: Alignment.center,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: darkGrey900,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/upload_cloud.svg'),
                                  SizedBox(width: 8),
                                  Text(
                                    "Add photos",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
              SizedBox(height: 27),
              TextFieldForm(
                title: 'Vehicle Name',
                hintText: 'Enter vehicle name',
                helperText: 'Limit vehicle name to 25 characters',
                controller: _vehicleNameController,
                submitted: _submitted,
                maxLength: 25,
              ),
              SizedBox(height: 14),
              TextFieldForm(
                title: 'Registration Number',
                hintText: 'Enter registration number',
                controller: _registrationController,
                submitted: _submitted,
              ),
              SizedBox(height: 14),
              TextFieldForm(
                title: 'Model',
                hintText: 'Enter model',
                controller: _modelController,
                submitted: _submitted,
              ),
              SizedBox(height: 14),
              TextFieldForm(
                title: 'Year',
                hintText: 'Enter year',
                controller: _yearController,
                submitted: _submitted,
                inputType: TextInputType.number,
                maxLength: 4,
              ),
              SizedBox(height: 14),
              TextFieldForm(
                title: 'Color',
                hintText: 'Enter color',
                controller: _colorController,
                submitted: _submitted,
              ),
              SizedBox(height: 14),
              DateForm(
                title: 'Purchase Date',
                hintText: 'Select date',
                controller: _dateController,
                submitted: _submitted,
              ),
              SizedBox(height: 14),
              Text(
                'Battery Configuration',
                style: AppTextStyle.formLabel,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  BatterySelection('Speedster', BatteryType.speedster),
                  SizedBox(width: 10),
                  BatterySelection('Duro', BatteryType.duro),
                ],
              ),
              SizedBox(height: 8),
              _submitted && _selectedBattery == BatteryType.none
                  ? Text(
                      'Please select the battery configuration',
                      style: GoogleFonts.montserrat(
                        color: errorColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    )
                  : Text(
                      'Select the battery configuration to get the correct reading of your battery status.',
                      style: AppTextStyle.subtitle7,
                    ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
              left: 16, right: 16, bottom: Platform.isIOS ? 8 : 16, top: 12),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(24),
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _submitted = true;
                  });
                  _validateForm();
                },
                borderRadius: BorderRadius.circular(24),
                splashColor: Colors.grey,
                child: Center(
                    child: vehicleState.maybeWhen(
                  loading: () => SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                  orElse: () => Text(
                    'Save',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BatterySelection(String label, BatteryType type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedBattery = type;
          });
        },
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: _selectedBattery == type
                ? Theme.of(context).primaryColor.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: _selectedBattery == type
                    ? Theme.of(context).primaryColor
                    : darkGrey800,
                width: 1),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyle.title4,
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    final vehicleName = _vehicleNameController.text;
    final registrationNumber = _registrationController.text;
    final model = _modelController.text;
    final year = _yearController.text;
    final color = _colorController.text;
    final purchaseDate = _dateController.text;

    if (vehicleName.isEmpty ||
        registrationNumber.isEmpty ||
        model.isEmpty ||
        year.isEmpty ||
        color.isEmpty ||
        purchaseDate.isEmpty ||
        _selectedBattery == BatteryType.none) {
      return;
    }

    _addVehicle(
      vehicleName,
      registrationNumber,
      model,
      year,
      color,
      purchaseDate,
    );
  }

  void _addVehicle(
    String vehicleName,
    String registrationNumber,
    String model,
    String year,
    String color,
    String purchaseDate,
  ) {
    var deviceId = '';
    if (widget.detail.vehicle == null) {
      deviceId = widget.detail.device?.id ?? UniqueKey().toString();
    } else {
      deviceId = widget.detail.vehicle!.deviceId;
    }

    ref.read(vehicleDetailsViewModel.notifier).addVehicle(
          vehicle?.serverDeviceId ?? widget.detail.serverDeviceId ?? '',
          deviceId,
          vehicle?.vehicleId,
          vehicleName.trim(),
          registrationNumber.trim(),
          model.trim(),
          year.trim(),
          color.trim(),
          purchaseDate,
          image?.path,
          vehicle?.physicalNumber,
          vehicle?.creatorUserId,
          _selectedBattery,
        );
  }
}

class VehicleDetailData {
  String? serverDeviceId;
  DiscoveredDevice? device;
  Vehicle? vehicle;
  bool isFromVehicleHome;

  VehicleDetailData({
    this.device,
    this.vehicle,
    this.isFromVehicleHome = false,
    this.serverDeviceId,
  });
}
