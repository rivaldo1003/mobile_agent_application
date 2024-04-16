import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:elderselettricomobile/presentation/setting/personal_information/pages/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoBottomSheet extends StatefulWidget {
  @override
  State<ProfilePhotoBottomSheet> createState() =>
      _ProfilePhotoBottomSheetState();
}

class _ProfilePhotoBottomSheetState extends State<ProfilePhotoBottomSheet> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(13),
        ),
        color: darkGrey900,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/icons/handle.svg'),
                ),
              ),
            ],
          ),
          SizedBox(height: 32),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a photo',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Get.back();
                    getImage(ImageSource.camera);
                  },
                  child: AddPhoto(
                    title: 'Take a photo',
                    icon: 'assets/icons/camera_image.svg',
                  ),
                ),
                SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Get.back();
                    getImage(ImageSource.gallery);
                  },
                  child: AddPhoto(
                    title: 'Upload from photos',
                    icon: 'assets/icons/upload_image.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
