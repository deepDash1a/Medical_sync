import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_sync/core/helper_folders/images.dart';
import 'package:medical_sync/core/theme/text_style.dart';

class CustomLogoAndName extends StatelessWidget {
  const CustomLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImageManager.medicalSyncLogo,
        ),
        SizedBox(
          width: 10.00.w,
        ),
        Text(
          'MedicalSync',
          style: TextStyleManager.font30(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
