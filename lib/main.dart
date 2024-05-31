import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/di/dependency_injection.dart';
import 'package:medical_sync/core/routing/app_router.dart';
import 'package:medical_sync/medical_sync.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    MedicalSync(
      appRouter: AppRouter(),
    ),
  );
}
