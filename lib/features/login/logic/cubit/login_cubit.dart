import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_sync/features/login/data/model/login_request.dart';
import 'package:medical_sync/features/login/data/repository/login_repository.dart';
import 'package:medical_sync/features/login/logic/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(const LoginStates.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequest loginRequest) async {
    emit(const LoginStates.loading());
    final response = await _loginRepository.login(loginRequest);
    response.when(
      success: (loginResponse) {
        emit(
          LoginStates.success(loginResponse),
        );
      },
      failure: (error) {
        emit(
          LoginStates.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
