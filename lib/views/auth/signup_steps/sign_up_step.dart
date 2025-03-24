import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_input.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class SignUpStep extends StatefulWidget {
  final VoidCallback onNext;

  const SignUpStep({super.key, required this.onNext});

  @override
  _SignUpStepState createState() => _SignUpStepState();
}

class _SignUpStepState extends State<SignUpStep> {
  final TextEditingController _passwordController =
      TextEditingController(text: "");
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: "");
  final TextEditingController _numberController =
      TextEditingController(text: "");

  bool _hasMinLength = false;
  bool _hasUpperCase = false;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;

  void _validatePassword(dynamic password) {
    setState(() {
      final String pass = password.toString();
      _hasMinLength = pass.length >= 8;
      _hasUpperCase = RegExp(r'[A-Z]').hasMatch(pass);
      _hasNumber = RegExp(r'[0-9]').hasMatch(pass);
      _hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pass);
    });
  }

  bool get allRequirementsMet =>
      _hasMinLength && _hasUpperCase && _hasNumber && _hasSpecialChar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.globalHorizontal,
                    vertical: AppStyles.globalVertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 8),
                    _buildSubheader(context),
                    const SizedBox(height: 34),
                    CustomInput(
                      hint: S.of(context).phoneNumber,
                      icon: CupertinoIcons.phone_fill,
                      controller: _numberController,
                      onChanged: (_) {},
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordInput(context),
                    const SizedBox(height: 16),
                    _buildCreateAccountButton(),
                    const SizedBox(height: 16),
                    Align(
                        alignment: Alignment.center,
                        child: _buildSignUpButton(context))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).signUp,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _buildSubheader(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Text(
      S.of(context).signUpSubheader,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: isDarkTheme ? null : Colors.grey),
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomInput(
          hint: S.of(context).password,
          icon: CupertinoIcons.lock_fill,
          controller: _passwordController,
          isPassword: true,
          onChanged: _validatePassword,
        ),
        const SizedBox(height: 16),
        Text(
          S.of(context).passwordRequirement,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: isDarkTheme ? null : Colors.grey),
        ),
        const SizedBox(height: 10),
        _buildRequirement(S.of(context).minLengthRequirement, _hasMinLength),
        _buildRequirement(S.of(context).uppercaseRequirement, _hasUpperCase),
        _buildRequirement(S.of(context).digitRequirement, _hasNumber),
        _buildRequirement(
          S.of(context).specialCharRequirement,
          _hasSpecialChar,
        ),
      ],
    );
  }

  Widget _buildRequirement(String text, bool isMet) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Row(
      children: [
        Icon(
          isMet
              ? CupertinoIcons.checkmark_alt_circle_fill
              : CupertinoIcons.circle,
          color: isMet ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(text,
              softWrap: true,
              style: isDarkTheme
                  ? Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isMet
                            ? Colors.green
                            : Theme.of(context).textTheme.labelLarge?.color,
                      )
                  : Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isMet ? Colors.green : Colors.grey,
                      )),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${S.of(context).alreadyHaveAnAccount} ',
        style: Theme.of(context).textTheme.labelLarge,
        children: <TextSpan>[
          TextSpan(
            text: S.of(context).login,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, '/login');
              },
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.globalHorizontal),
      child: CustomButton(
        text: S.of(context).continuee,
        isEnabled: allRequirementsMet,
        onPressed: allRequirementsMet
            ? () {
                widget.onNext();
              }
            : null,
      ),
    );
  }
}
