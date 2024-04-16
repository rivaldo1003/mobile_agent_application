import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../core/values/colors.dart';

class DateForm extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool? submitted;

  const DateForm({
    required this.title,
    required this.hintText,
    required this.controller,
    this.submitted,
  });

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {

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
      child:
      ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (_, value, __) {
            return       Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyle.formLabel,
                ),
                SizedBox(height: 8),
                Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: darkGrey800,
                    borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: _errorText != null ?  borderErrorColor : Colors.transparent,
                          width: 0.8
                      )
                  ),
                  child: TextField(
                    controller: widget.controller,
                    readOnly: true,
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
                    onTap: () async {
                      final picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2101),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.dark().copyWith(
                                  colorScheme: const ColorScheme.dark(
                                    primary: brownColor,
                                  )),
                              child: child!,
                            );
                          });
                      if (picked != null) {
                        String formattedDate =
                        DateFormat('MMMM dd, yyyy').format(picked);
                        setState(() {
                          widget.controller.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
                _errorText != null ? Column(
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
                ) : Container(),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
