import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/constants/color.dart';

class KTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  final TextEditingController? controller;
  final String? hint;
  final String? initialValue;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final String? desc;
  final bool? enabled;
  final IconData? prefix;
  final int? maxLength;
  final bool? isProfile;
  final TextCapitalization? textCapitalization;
  const KTextFormField(
      {Key? key,
      this.validator,
      this.enabled = true,
      this.hint,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.controller,
      this.prefix,
      this.desc,
      this.maxLength,
      this.onChanged,
      this.isProfile = false,
      this.textCapitalization,
      this.initialValue})
      : super(key: key);

  @override
  _KTextFormFieldState createState() =>
      // ignore: no_logic_in_create_state
      _KTextFormFieldState(obscureText: obscureText);
}

class _KTextFormFieldState extends State<KTextFormField> {
  String? errorText;
  bool interacted = false;

  bool obscureText;

  _KTextFormFieldState({required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisSize: MainAxisSize.,
        children: [
          if (widget.label.isNotEmpty)
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 16,
                          fontWeight: widget.isProfile == true
                              ? FontWeight.w600
                              : FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                  ),
                ),
              ],
            ),
          if (widget.desc != null)
            Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.info_outline_rounded,
                        size: 14, color: textColor),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        widget.desc ?? "",
                        // overflow: TextOverflow.visible,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            height: 1.3,
                            color: Color.fromARGB(255, 122, 122, 122)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            enabled: widget.enabled,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            obscureText: obscureText,
            initialValue: widget.initialValue,
            maxLength: widget.maxLines > 1 ? 1000 : 100,
            maxLines: widget.maxLines,
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 14,
                  fontFamily: "Poppins",
                ),
            cursorColor: Color(0xff1C1B1F),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1, color: Color(0xff7C8492)),
              ),
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  color: Color(0xff7C8492)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: Color(0xff1C1B1F)),
              ),
              prefixIcon: widget.prefix != null
                  ? Icon(
                      widget.prefix,
                      color: Color(0xff8E8E93),
                      size: 24,
                    )
                  : null,
              isDense: true, // Added this
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              errorStyle: TextStyle(
                height: 0,
                fontSize: 0,
              ),

              /// For passwords, we need a toggle icon instead of the checkmark,
              /// so we show the toggle buttons as a first priority, then the checkmark.
              suffixIcon: widget.maxLines == 1
                  ? widget.obscureText
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Color(0xff1C1B1F),
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        )
                      : interacted && errorText == null
                          ? Icon(Icons.check,
                              color: Theme.of(context).primaryColor)
                          : null
                  : null,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: Color(0xffd23838)),
              ),
              enabledBorder: (interacted && errorText == null)
                  ? Theme.of(context).inputDecorationTheme.focusedBorder
                  : null,
            ),
            validator: (value) {
              if (widget.validator != null) {
                setState(() {
                  errorText = widget.validator!(value);
                });
              }
              return errorText;
            },
            autovalidateMode: AutovalidateMode.disabled,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!.call(value);
              } else {
                if (widget.validator != null) {
                  setState(() {
                    errorText = widget.validator!(value);
                  });
                }
              }
            },
            onSaved: (value) {
              if (widget.validator != null) {
                setState(() {
                  errorText = widget.validator!(value);
                });
              }
            },
            onFieldSubmitted: (value) {
              if (widget.validator != null) {
                setState(() {
                  errorText = widget.validator!(value);
                });
              }
            },
          ),
          errorText != null
              ? Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: Color(0xffd8232f),
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            errorText ?? "",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.sp,
                                height: 1.3,
                                color: Color(0xffd8232f)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
