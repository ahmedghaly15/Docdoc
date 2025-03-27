import 'package:docdoc/src/config/themes/app_colors.dart';
import 'package:docdoc/src/core/helpers/app_regex.dart';
import 'package:docdoc/src/core/helpers/auth_helper.dart';
import 'package:docdoc/src/core/widgets/custom_text_form_field.dart';
import 'package:docdoc/src/core/widgets/primary_button.dart';
import 'package:docdoc/src/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:docdoc/src/features/auth/presentation/views/widgets/email_text_form_field.dart';
import 'package:docdoc/src/features/auth/presentation/views/widgets/password_validations.dart';
import 'package:docdoc/src/features/auth/presentation/views/widgets/text_field_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmationController;
  late final TextEditingController _phoneNumberController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _passwordConfirmationFocusNode;
  late final FocusNode _phoneNumberFocusNode;

  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autoValidateMode;

  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    _initFormAttributes();
    _initControllers();
    _initFocusNodes();
    _setupPasswordControllerListener();
    super.initState();
  }

  void _setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(_passwordController.text);
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }

  void _initControllers() {
    _nameController = context.read<RegisterCubit>().nameController;
    _emailController = context.read<RegisterCubit>().emailController;
    _passwordController = context.read<RegisterCubit>().passwordController;
    _passwordConfirmationController =
        context.read<RegisterCubit>().passwordConfirmationController;
    _phoneNumberController =
        context.read<RegisterCubit>().phoneNumberController;
  }

  void _initFocusNodes() {
    _emailFocusNode = context.read<RegisterCubit>().emailFocusNode;
    _passwordFocusNode = context.read<RegisterCubit>().passwordFocusNode;
    _passwordConfirmationFocusNode =
        context.read<RegisterCubit>().passwordConfirmationFocusNode;
    _phoneNumberFocusNode = context.read<RegisterCubit>().phoneNumberFocusNode;
  }

  void _initFormAttributes() {
    _formKey = context.read<RegisterCubit>().formKey;
    autoValidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.dispose();
  }

  void _disposeControllers() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _phoneNumberController.dispose();
  }

  void _disposeFocusNodes() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmationFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            hintText: 'Name',
            controller: _nameController,
            keyboardType: TextInputType.name,
            autofillHints: const <String>[AutofillHints.name],
            validating: (String? val) {
              if (val == null || val.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const TextFieldSeparator(),
          EmailTextFormField(
            emailController: _emailController,
            emailFocusNode: _emailFocusNode,
            passwordFocusNode: _passwordFocusNode,
          ),
          const TextFieldSeparator(),
          CustomTextFormField(
            hintText: 'Password',
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            obscureText: isPasswordObscureText,
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const <String>[AutofillHints.password],
            validating: (String? val) =>
                AuthHelper.validatingPasswordField(value: val),
            suffix: IconButton(
              icon: Icon(
                isPasswordObscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.hintColor,
              ),
              onPressed: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
            ),
            onEditingComplete: () {
              AuthHelper.requestFocus(context, _passwordConfirmationFocusNode);
            },
          ),
          const TextFieldSeparator(),
          CustomTextFormField(
            hintText: 'Confirm Password',
            controller: _passwordConfirmationController,
            focusNode: _passwordConfirmationFocusNode,
            obscureText: isPasswordConfirmationObscureText,
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const <String>[AutofillHints.password],
            validating: (String? val) =>
                AuthHelper.validatingPasswordField(value: val),
            suffix: IconButton(
              icon: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.hintColor,
              ),
              onPressed: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
            ),
            onEditingComplete: () {
              AuthHelper.requestFocus(context, _phoneNumberFocusNode);
            },
          ),
          const TextFieldSeparator(),
          CustomTextFormField(
            hintText: 'Phone Number',
            controller: _phoneNumberController,
            focusNode: _phoneNumberFocusNode,
            keyboardType: TextInputType.phone,
            autofillHints: const <String>[AutofillHints.telephoneNumber],
            validating: (String? val) =>
                AuthHelper.validatePhoneField(value: val),
          ),
          SizedBox(height: 24.h),
          const PasswordValidations(),
          SizedBox(height: 32.h),
          PrimaryButton(
            onPressed: () => validateAndDoRegister(context),
            text: 'Sign up',
          ),
        ],
      ),
    );
  }

  validateAndDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register();
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}
