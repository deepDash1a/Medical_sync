import 'package:flutter/material.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyleManager.font13(
              fontWeight: FontWeight.w400,
              color: ColorManager.greyColor,
              height: 4.00,
            ),
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyleManager.font13(
              fontWeight: FontWeight.w600,
              color: ColorManager.blackColor,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyleManager.font13(
              fontWeight: FontWeight.w400,
              color: ColorManager.greyColor,
            ),
          ),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: TextStyleManager.font13(
              fontWeight: FontWeight.w600,
              color: ColorManager.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
