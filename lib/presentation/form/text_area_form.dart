import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/colors.dart';
import '../common/text_style.dart';

class TextAreaForm extends StatefulWidget {
  final String title;
  final String hintText;
  final String? helperText;
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? submitted;

  TextAreaForm({
    required this.title,
    required this.hintText,
    required this.controller,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.helperText,
    this.submitted,
  });

  @override
  State<TextAreaForm> createState() => _TextAreaFormState();
}

class _TextAreaFormState extends State<TextAreaForm> {
  String? get _errorText {
    final text = widget.controller.value.text;

    if (text.isEmpty && widget.submitted == true) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (_, value, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppTextStyle.formLabel,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: darkGrey800,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: _errorText != null
                            ? borderErrorColor
                            : Colors.transparent,
                        width: 0.8)),
                child: TextField(
                  controller: widget.controller,
                  cursorColor: Colors.white,
                  cursorWidth: 1.5,
                  keyboardType: TextInputType.multiline,
                  minLines: widget.minLines ?? 2,
                  maxLines: widget.maxLines,
                  maxLength: null,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: GoogleFonts.montserrat(
                      color: darkGrey100,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.only(left: 14, bottom: 8),
                  ),
                ),
              ),
              widget.helperText != null && _errorText == null
                  ? Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          widget.helperText!,
                          style: GoogleFonts.montserrat(
                            color: darkGrey200,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              _errorText != null
                  ? Column(
                      children: [
                        SizedBox(height: 8),
                        Text(
                          _errorText!,
                          style: GoogleFonts.montserrat(
                            color: errorColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
