import 'package:flutter/material.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class CustomTextButton extends StatelessWidget {
  Function onPressed;
  String text;
  Color textColor;
  FontWeight textFontWeight;

  CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = ColorManager.blurColor,
    this.textFontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyleManager.font13(
          color: textColor,
          fontWeight: textFontWeight,
        ),
      ),
    );
  }
}
