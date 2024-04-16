import 'package:elderselettricomobile/domain/model/config.dart';
import 'package:elderselettricomobile/presentation/form/text_area_form.dart';
import 'package:elderselettricomobile/presentation/form/text_field_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';
import '../common/primary_button.dart';
import '../common/text_style.dart';

class AddConfigMode extends StatefulWidget {
  const AddConfigMode({ConfigMode? this.configMode});

  final ConfigMode? configMode;

  @override
  State<AddConfigMode> createState() => _AddConfigModeState();
}

class _AddConfigModeState extends State<AddConfigMode> {
  final _configNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  var _submitted = false;

  @override
  void initState() {
    if (widget.configMode != null) {
      final configMode = widget.configMode!;
      _configNameController.text = configMode.name;
      _descriptionController.text = configMode.description ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 56,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: SvgPicture.asset('assets/icons/button_back.svg'),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.configMode?.name ?? 'Add config mode',
            style: AppTextStyle.title2,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: darkGrey800,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Change icons',
                style: GoogleFonts.montserrat(
                  color: brownColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 16),
              TextFieldForm(
                title: 'Config Name',
                hintText: 'Enter config name',
                controller: _configNameController,
              ),
              SizedBox(height: 16),
              TextAreaForm(
                title: 'Description',
                hintText: 'Enter description',
                controller: _descriptionController,
                helperText: 'Limit description to 255 characters',
                minLines: 6,
                maxLines: 6,
                maxLength: 255,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: LargePrimaryButton(
            label: 'Save',
            onTap: () {
              setState(() {
                _submitted = true;
              });
            },
          ),
        ));
  }
}
