import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBuildValidationRow(
          'At least one lower case letter',
          hasLowerCase,
        ),
        SizedBox(height: 2.00.h),
        buildBuildValidationRow(
          'At least one upper case letter',
          hasUpperCase,
        ),
        SizedBox(height: 2.00.h),
        buildBuildValidationRow(
          'At least one special character',
          hasSpecialCharacters,
        ),
        SizedBox(height: 2.00.h),
        buildBuildValidationRow(
          'At least one number',
          hasNumber,
        ),
        SizedBox(height: 2.00.h),
        buildBuildValidationRow(
          'min length',
          hasMinLength,
        ),
        SizedBox(height: 2.00.h),
      ],
    );
  }

  Widget buildBuildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: ColorManager.greyColor,
        ),
        SizedBox(width: 6.00.w),
        Text(
          text,
          style: TextStyleManager.font13(
            color: ColorManager.greyColor,
          ).copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
            decorationColor:
                hasValidated ? ColorManager.greyColor : ColorManager.blurColor,
          ),
        )
      ],
    );
  }
}
