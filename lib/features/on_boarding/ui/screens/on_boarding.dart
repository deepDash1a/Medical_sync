import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/routing/routes.dart';
import 'package:medical_sync/core/shared_widgets/custom_button.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';
import 'package:medical_sync/features/on_boarding/ui/widgets/custom_image_and_hint.dart';
import 'package:medical_sync/features/on_boarding/ui/widgets/custom_logo_and_name.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.00.h,
              horizontal: 20.00.w,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const CustomLogoAndName(),
                  SizedBox(height: 20.00.h),
                  const CustomImageAndHint(),
                  Text(
                    'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyleManager.font13(
                      color: ColorManager.greyColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 30.00.h),
                  CustomButton(
                    function: () {
                      setState(() {
                        Navigator.pushNamed(context, Routes.loginScreen);
                      });
                    },
                    text: 'Get Started',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
