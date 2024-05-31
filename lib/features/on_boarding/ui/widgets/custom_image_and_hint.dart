import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_sync/core/helper_folders/images.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class CustomImageAndHint extends StatelessWidget {
  const CustomImageAndHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              ImageManager.backgroundOnBoardingImage,
            ),
            Container(
              foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  ColorManager.whiteColor,
                  ColorManager.whiteColor.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: const [0.14, 0.9],
              )),
              child: Image.asset(ImageManager.doctorImage),
            ),
            Positioned(
              bottom: 30.00,
              child: Text(
                'Best Doctor \nAppointment App',
                textAlign: TextAlign.center,
                style: TextStyleManager.font30(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blurColor,
                  height: 1.3.h,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
