import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/login/data/models/login_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/features/login/data/repos/login_repo.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) {
        // Check the status field from your API response
        if (loginResponse.status == true && loginResponse.code == 200) {
          emit(LoginState.success(loginResponse));
        } else {
          emit(
            LoginState.error(error: loginResponse.message ?? 'Login failed'),
          );
        }
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
