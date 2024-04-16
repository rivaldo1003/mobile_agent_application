import 'dart:io';

import 'package:elderselettricomobile/domain/model/direction_response.dart';
import 'package:elderselettricomobile/domain/model/trip.dart';
import 'package:elderselettricomobile/presentation/common/primary_button.dart';
import 'package:elderselettricomobile/presentation/maps/viewmodels/maps_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/values/icons.dart';
import '../../../domain/model/vehicle.dart';
import '../../../core/values/colors.dart';
import '../../bluetooth/viewmodels/battery_viewmodel.dart';
import '../../common/custom_network_image.dart';
import '../../common/text_style.dart';
import '../search_destination_page.dart';
import '../viewmodels/estimated_trip_viewmodel.dart';
import '../viewmodels/search_location_viewmodel.dart';

class EstimatedTripBottomSheet extends StatefulWidget {
  const EstimatedTripBottomSheet({
    this.onClose,
    this.onStartTrip,
  });

  final Function()? onClose;
  final Function(Trip, DirectionRoutes?)? onStartTrip;

  @override
  State<EstimatedTripBottomSheet> createState() =>
      _EstimatedTripBottomSheetState();
}

class _EstimatedTripBottomSheetState extends State<EstimatedTripBottomSheet> {
  @override
  void initState() {
    final viewmodel = context.read<EstimatedTripViewModel>();
    viewmodel.currentAddress = viewmodel.currentTrip.currentAddress;
    viewmodel.getDirections();
    viewmodel.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onClose,
          child: Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkGrey700,
            ),
            child: SvgPicture.asset('assets/icons/close2.svg'),
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
            ),
            color: surfaceColor,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              Center(child: SvgPicture.asset('assets/icons/handle.svg')),
              SizedBox(height: 16),
              Text(
                'Your estimated trip',
                style: AppTextStyle.title2,
              ),
              SizedBox(height: 24),
              _buildRoute(),
              SizedBox(height: 24),
              Text(
                'Active vehicle',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              _buildActiveVehicle(),
              SizedBox(height: 24),
              context.read<MapsViewModel>().vehicle != null
                  ? LargePrimaryButton(
                      margin: EdgeInsets.only(bottom: 12),
                      label: 'Start trip',
                      onTap: () {
                        final viewModel =
                            context.read<EstimatedTripViewModel>();
                        widget.onStartTrip?.call(
                          viewModel.currentTrip,
                          viewModel.directionRoutes,
                        );
                      },
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRoute() {
    final viewmodel = context.watch<EstimatedTripViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Routes',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: darkGrey800, borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/current_location.svg'),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  viewmodel.currentAddress ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.subtitle3,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            Trip? selectedDest = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => SearchLocationViewModel(),
                  child: SearchDestinationPage(
                    currentAdress: viewmodel.currentAddress,
                  ),
                ),
              ),
            );

            if (selectedDest != null) {
              viewmodel.currentTrip = selectedDest;
              viewmodel.getDirections();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: darkGrey800,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Row(children: [
              SvgPicture.asset('assets/icons/destination_location.svg'),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  viewmodel.currentTrip.destination ?? '-',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle.subtitle3,
                ),
              )
            ]),
          ),
        )
      ],
    );
  }

  Widget _buildActiveVehicle() {
    final vehicle = context.read<MapsViewModel>().vehicle;
    final viewmodel = context.watch<EstimatedTripViewModel>();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkGrey800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: vehicle != null
          ? Column(
              children: [
                Row(
                  children: [
                    _buildVehicleImage(vehicle),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.vehicleName,
                          style: AppTextStyle.title2,
                        ),
                        SizedBox(height: 5),
                        RichText(
                            text: TextSpan(
                          text: 'License Number: ',
                          style: AppTextStyle.subtitle7,
                          children: [
                            TextSpan(
                              text: vehicle.registrationNumber,
                              style: AppTextStyle.snackBarTitle,
                            )
                          ],
                        )),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  color: darkGrey600,
                  height: 1,
                ),
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trip distance',
                      style: AppTextStyle.subtitle9,
                    ),
                    viewmodel.distance != null
                        ? Text(
                            '${viewmodel.distance!.toStringAsFixed(2)} km',
                            style: AppTextStyle.title4,
                          )
                        : Container()
                  ],
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    Text(
                      'Battery capacity',
                      style: AppTextStyle.subtitle9,
                    ),
                    Spacer(),
                    AppIcons.svg(
                      'battery_horizontal',
                      color: context.read<BatteryViewModel>().dataDuro == null
                          ? darkGrey400
                          : null,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${context.read<BatteryViewModel>().getBatteryPercentage()} %',
                      style: AppTextStyle.title4,
                    )
                  ],
                )
              ],
            )
          : _buildVehicleNotFound(),
    );
  }

  Widget _buildVehicleNotFound() {
    return Column(
      children: [
        SizedBox(height: 16),
        Text(
          'Vehicle not found',
          style: AppTextStyle.title3,
        ),
        SizedBox(height: 8),
        Text(
          "You are currently not connected to any vehicles, please try to connect first.",
          style: AppTextStyle.subtitle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildVehicleImage(Vehicle data) {
    return data.photoPath.isEmpty && data.photoUrl == null
        ? Container(
            width: 64,
            height: 64,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/vespa3.png',
            ),
          )
        : data.photoUrl != null
            ? CustomNetworkImage(
                imageUrl: data.photoUrl!,
                width: 64,
                height: 64,
                radius: 8,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(data.photoPath),
                  fit: BoxFit.cover,
                  width: 64,
                  height: 64,
                ),
              );
  }
}
