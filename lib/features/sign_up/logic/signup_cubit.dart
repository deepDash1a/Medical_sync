import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_sync/features/sign_up/data/model/signup_request.dart';
import 'package:medical_sync/features/sign_up/data/repository/signup_repository.dart';
import 'package:medical_sync/features/sign_up/logic/signup_states.dart';

class SignupCubit extends Cubit<SignUpStates> {
  final SignupRepository _signupRepository;

  SignupCubit(this._signupRepository) : super(const SignUpStates.initial());

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void emitSignupStates(SignupRequest signupRequest) async {
    emit(const SignUpStates.loading());
    final response = await _signupRepository.sign(signupRequest);
    response.when(
      success: (data) {
        emit(
          SignUpStates.success(response),
        );
      },
      failure: (error) {
        emit(
          SignUpStates.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
