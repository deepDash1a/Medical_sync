import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_sync/core/helper_folders/app_regex.dart';
import 'package:medical_sync/core/shared_widgets/custom_text_form_field.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_sync/features/login/ui/widgets/password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  TextEditingController? passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
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
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            obscureText: isObscure,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please, enter a valid password';
              }
            },
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ColorManager.greyColor.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(
            height: 20.00.h,
          ),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
// @override
// void dispose() {
//   passwordController!.dispose();
//   super.dispose();
// }
}
