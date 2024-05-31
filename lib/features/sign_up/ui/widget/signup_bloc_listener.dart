import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_sync/core/helper_folders/extension.dart';
import 'package:medical_sync/core/routing/routes.dart';
import 'package:medical_sync/core/shared_widgets/custom_text_button.dart';
import 'package:medical_sync/core/theme/colors.dart';
import 'package:medical_sync/core/theme/text_style.dart';
import 'package:medical_sync/features/sign_up/logic/signup_cubit.dart';
import 'package:medical_sync/features/sign_up/logic/signup_states.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  void setUpErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          CustomTextButton(
            onPressed: () {
              context.pop();
            },
            text: 'Got it',
          ),
        ],
        icon: const Icon(
          Icons.error_outline,
          color: ColorManager.redColor,
          size: 32.00,
        ),
        content: Text(
          error,
          style: TextStyleManager.font16(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignUpStates>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.blurColor,
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushName(Routes.homeScreen);
          },
          error: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: const Text(''),
    );
  }
}
