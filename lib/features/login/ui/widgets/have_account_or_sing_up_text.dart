import 'package:flutter/cupertino.dart';
import 'package:medical_sync/core/shared_widgets/custom_text_button.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class HaveAccountOrSignUp extends StatelessWidget {
  HaveAccountOrSignUp({
    super.key,
    required this.onPressed,
  });

  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account yet? ',
          style: TextStyleManager.font13(
            fontWeight: FontWeight.w400,
            color: ColorManager.greyColor,
          ),
        ),
        CustomTextButton(
          onPressed: () {
            onPressed();
          },
          text: 'SignUp',
          textFontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
