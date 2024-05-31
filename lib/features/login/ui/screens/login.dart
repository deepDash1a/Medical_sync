import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_sync/core/helper_folders/extension.dart';
import 'package:medical_sync/core/helper_folders/images.dart';
import 'package:medical_sync/core/routing/routes.dart';
import 'package:medical_sync/core/shared_widgets/custom_button.dart';
import 'package:medical_sync/core/shared_widgets/custom_text_button.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';
import 'package:medical_sync/features/login/data/model/login_request.dart';
import 'package:medical_sync/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_sync/features/login/ui/widgets/email_and_password.dart';
import 'package:medical_sync/features/login/ui/widgets/have_account_or_sing_up_text.dart';
import 'package:medical_sync/features/login/ui/widgets/login_bloc_listner.dart';
import 'package:medical_sync/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  buildValidateThenToDo(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequest(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.00.h,
                horizontal: 20.00.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyleManager.font25(
                      color: ColorManager.blurColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.00.h,
                  ),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    maxLines: 3,
                    style: TextStyleManager.font14(
                      color: ColorManager.greyColor,
                      fontWeight: FontWeight.w400,
                      height: 2.00,
                    ),
                  ),
                  SizedBox(
                    height: 40.00.h,
                  ),
                  Column(
                    children: [
                      const EmailAndPassword(),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomTextButton(
                          onPressed: () {},
                          text: 'Forgot Password?',
                        ),
                      ),
                      SizedBox(
                        height: 30.00.h,
                      ),
                      CustomButton(
                        function: () {
                          buildValidateThenToDo(context);
                        },
                        text: 'Login',
                      ),
                    ],
                  ),
                  const TermsAndConditionsText(),
                  SizedBox(
                    height: 30.00.h,
                  ),
                  HaveAccountOrSignUp(
                    onPressed: () {
                      context.pushReplacementNamed(
                        Routes.signUpScreen,
                      );
                    },
                  ),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
