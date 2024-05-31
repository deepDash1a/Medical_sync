import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/shared_widgets/custom_button.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';
import 'package:medical_sync/features/sign_up/data/model/signup_request.dart';
import 'package:medical_sync/features/sign_up/logic/signup_cubit.dart';
import 'package:medical_sync/features/sign_up/ui/widget/name_email_phone_gender_password.dart';
import 'package:medical_sync/features/sign_up/ui/widget/signup_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  buildValidateThenToDo(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate() &&
        context.read<SignupCubit>().passwordController.text ==
            context.read<SignupCubit>().confirmPasswordController.text) {
      context.read<SignupCubit>().emitSignupStates(
            SignupRequest(
              name: context.read<SignupCubit>().nameController.text,
              email: context.read<SignupCubit>().emailController.text,
              phone: context.read<SignupCubit>().phoneController.text,
              gender: context.read<SignupCubit>().genderController.text,
              password: context.read<SignupCubit>().passwordController.text,
              confirmPassword:
                  context.read<SignupCubit>().passwordController.text,
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
                    'Create Account',
                    style: TextStyleManager.font25(
                      color: ColorManager.blurColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.00.h,
                  ),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    maxLines: 3,
                    style: TextStyleManager.font14(
                      color: ColorManager.greyColor,
                      fontWeight: FontWeight.w400,
                      height: 2.00,
                    ),
                  ),
                  SizedBox(
                    height: 20.00.h,
                  ),
                  const NameAndEmailAndPhoneAndGenderAndPassword(),
                  SizedBox(
                    height: 20.00.h,
                  ),
                  CustomButton(
                    function: () {
                      buildValidateThenToDo(context);
                    },
                    text: 'Create Account',
                  ),
                  const SignupBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
