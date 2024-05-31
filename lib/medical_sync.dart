import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/routing/app_router.dart';
import 'package:medical_sync/core/routing/routes.dart';
import 'package:medical_sync/core/theme/colors.dart';

class MedicalSync extends StatelessWidget {
  final AppRouter appRouter;
  const MedicalSync({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.whiteColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorManager.blurColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
