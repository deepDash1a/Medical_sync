import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_sync/core/di/dependency_injection.dart';
import 'package:medical_sync/core/routing/routes.dart';
import 'package:medical_sync/features/home_screen/ui/screens/home_screen.dart';
import 'package:medical_sync/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_sync/features/login/ui/screens/login.dart';
import 'package:medical_sync/features/on_boarding/ui/screens/on_boarding.dart';
import 'package:medical_sync/features/sign_up/logic/signup_cubit.dart';
import 'package:medical_sync/features/sign_up/ui/screen/signup.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<SignupCubit>(),
              child: const SignUpScreen()),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
    return null;
  }
}
