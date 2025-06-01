
import 'package:flutter_application_1/features/login/data/models/login_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/features/login/data/repos/login_repo.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async{
    emit(const LoginState.loading());
    final Response = await _loginRepo.login(loginRequestBody);
  }
}
