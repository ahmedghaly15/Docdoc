import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:docdoc/src/core/api/dio_factory.dart';
import 'package:docdoc/src/core/helpers/constants.dart';
import 'package:docdoc/src/core/helpers/shared_pref_helper.dart';
import 'package:docdoc/src/features/auth/data/models/login/login_request_body.dart';
import 'package:docdoc/src/features/auth/data/repos/login_repo.dart';
import 'package:docdoc/src/features/auth/presentation/cubits/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        await _saveUserToken(loginResponse.userData!.token!);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) => emit(LoginState.error(error: error.message ?? '')),
    );
  }

  Future<void> _saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeadersAfterLogin(token);
  }
}
