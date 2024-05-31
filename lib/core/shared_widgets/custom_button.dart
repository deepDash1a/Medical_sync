import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.function,
    required this.text,
  });

  final Function function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.00.h,
      width: 311.00.w,
      decoration: BoxDecoration(
        color: ColorManager.blurColor1Button,
        borderRadius: BorderRadius.circular(16.00.r),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyleManager.font16(
            color: ColorManager.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
