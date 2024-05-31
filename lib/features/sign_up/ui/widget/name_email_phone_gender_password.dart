import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/helper_folders/app_regex.dart';
import 'package:medical_sync/core/shared_widgets/custom_text_form_field.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';
import 'package:medical_sync/features/sign_up/logic/signup_cubit.dart';

class NameAndEmailAndPhoneAndGenderAndPassword extends StatefulWidget {
  const NameAndEmailAndPhoneAndGenderAndPassword({super.key});

  @override
  State<NameAndEmailAndPhoneAndGenderAndPassword> createState() =>
      _NameAndEmailAndPhoneAndGenderAndPasswordState();
}

class _NameAndEmailAndPhoneAndGenderAndPasswordState
    extends State<NameAndEmailAndPhoneAndGenderAndPassword> {
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  TextEditingController? passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    debugPrintThrottled(context.read<SignupCubit>().passwordController.text);
    debugPrintThrottled(
        context.read<SignupCubit>().confirmPasswordController.text);
    passwordController = context.read<SignupCubit>().passwordController;
    context.read<SignupCubit>().genderController.text = '0';
  }

  void setupPasswordControllerListener() {
    passwordController!.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController!.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController!.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController!.text);
        hasNumber = AppRegex.hasNumber(passwordController!.text);
        hasMinLength = AppRegex.hasMinLength(passwordController!.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please, enter a valid name';
              }
            },
          ),
          SizedBox(
            height: 20.00.h,
          ),
          CustomTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please, enter a valid email';
              }
            },
          ),
          SizedBox(
            height: 20.00.h,
          ),
          CustomTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: 'Phone',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'please, enter a valid phone';
              }
            },
          ),
          SizedBox(
            height: 20.00.h,
          ),
          Container(
            padding: EdgeInsetsDirectional.only(start: 20.00.w),
            decoration: BoxDecoration(
              color: ColorManager.whiteColor2TextFormFilled,
              borderRadius: BorderRadius.circular(16.00.r),
              border: Border.all(color: ColorManager.whiteColor1TextFormBorder),
            ),
            child: DropdownButton(
              underline: const SizedBox(),
              isExpanded: true,
              iconEnabledColor: ColorManager.greyColor,
              focusColor: ColorManager.blurColor,
              value: context.read<SignupCubit>().genderController.text,
              items: [
                DropdownMenuItem(
                  value: '0',
                  child: Text(
                    'Male',
                    style: TextStyleManager.font13(
                      color: ColorManager.blackColor.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: '1',
                  child: Text(
                    'Female',
                    style: TextStyleManager.font13(
                      color: ColorManager.blackColor.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              onChanged: (newValue) {
                setState(() {
                  context.read<SignupCubit>().genderController.text = newValue!;
                });
              },
            ),
          ),
          SizedBox(
            height: 20.00.h,
          ),
          CustomTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            obscureText: isObscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                isObscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ColorManager.greyColor1TextFormHint.withOpacity(
                  0.8,
                ),
              ),
              onPressed: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'please, enter a valid password';
              }
            },
          ),
          SizedBox(
            height: 20.00.h,
          ),
          CustomTextFormField(
            controller: context.read<SignupCubit>().confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: isObscureConfirmPassword,
            suffixIcon: IconButton(
              icon: Icon(
                isObscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: ColorManager.greyColor1TextFormHint.withOpacity(
                  0.8,
                ),
              ),
              onPressed: () {
                setState(() {
                  isObscureConfirmPassword = !isObscureConfirmPassword;
                });
              },
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'please, enter a valid password';
              }
            },
          ),
        ],
      ),
    );
  }
}
