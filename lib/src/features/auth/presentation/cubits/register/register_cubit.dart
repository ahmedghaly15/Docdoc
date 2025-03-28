import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:docdoc/src/features/auth/data/models/register_request_body.dart';
import 'package:docdoc/src/features/auth/data/repos/register_repo.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordConfirmationFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  void register() async {
    emit(const RegisterState.loading());

    final response = await _registerRepo.register(
      RegisterRequestBody(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneNumberController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );

    response.when(
      success: (registerResponse) =>
          emit(RegisterState.success(registerResponse)),
      failure: (error) => emit(RegisterState.error(error: error.message ?? '')),
    );
  }
}
