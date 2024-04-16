import 'dart:io';

import 'package:elderselettricomobile/presentation/maps/viewmodels/maps_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/vehicle.dart';
import '../../../core/values/colors.dart';
import '../../common/custom_network_image.dart';
import '../../common/text_style.dart';

class MyTripBottomSheet extends StatefulWidget {
  const MyTripBottomSheet({this.onCancel});

  final Function()? onCancel;

  @override
  State<MyTripBottomSheet> createState() => _MyTripBottomSheetState();
}

class _MyTripBottomSheetState extends State<MyTripBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final vehicle = context.read<MapsViewModel>().vehicle;
    return Container(
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
            'Your trip',
            style: AppTextStyle.title2,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //vehicle != null ? _buildVehicleImage(vehicle) : Container()
            ],
          ),
          SizedBox(height: 16),
          cancelButton(),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget cancelButton() {
    return Material(
      color: redColor,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: widget.onCancel,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/close2.svg'),
              SizedBox(
                width: 8,
              ),
              Text(
                'Cancel',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleImage(Vehicle data) {
    return data.photoPath.isEmpty && data.photoUrl == null
        ? Image.asset(
            'assets/images/vespa3.png',
            width: 44,
            height: 44,
          )
        : data.photoUrl != null
            ? CustomNetworkImage(
                imageUrl: data.photoUrl!,
                width: 44,
                height: 44,
                radius: 8,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(data.photoPath),
                  fit: BoxFit.cover,
                  width: 44,
                  height: 44,
                ),
              );
  }
}
