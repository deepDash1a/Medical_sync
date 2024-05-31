import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) validator;
  String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function? onChanged;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyleManager.font14(
          fontWeight: FontWeight.w500,
          color: ColorManager.greyColor1TextFormHint,
        ),
        filled: true,
        fillColor: ColorManager.whiteColor2TextFormFilled,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.00.w,
          vertical: 18.00.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.00.r),
          borderSide: BorderSide(
            color: ColorManager.blurColor,
            width: 1.00.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.00.r),
          borderSide: BorderSide(
            color: ColorManager.whiteColor1TextFormBorder,
            width: 1.00.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.00.r),
          borderSide: BorderSide(
            color: ColorManager.redColor,
            width: 1.00.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.00.r),
          borderSide: BorderSide(
            color: ColorManager.redColor,
            width: 1.00.w,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      onChanged: (value) {
        controller.text = value;
        if (kDebugMode) {
          print(controller.text);
        }
      },
    );
  }
}
