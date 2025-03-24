import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_input.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/auth/forgot_password_flow.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      backgroundColor: isDarkTheme
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppStyles.globalHorizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 8),
                      _buildSubheader(context),
                      const SizedBox(height: 34),
                      _buildNumberInput(context),
                      const SizedBox(height: 20),
                      _buildPasswordInput(context),
                      const SizedBox(height: 16),
                      _buildForgotPasswordButton(context)
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildCreateAccountButton(context),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppStyles.globalHorizontal),
                  child: _buildSignUpButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).loginHeader,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _buildSubheader(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Text(
      S.of(context).loginSubheader,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: isDarkTheme ? null : Colors.grey,
          ),
    );
  }

  Widget _buildNumberInput(BuildContext context) {
    return CustomInput(
      hint: S.of(context).phoneNumber,
      icon: CupertinoIcons.phone_fill,
      controller: TextEditingController(),
      onChanged: (_) {},
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return CustomInput(
      hint: S.of(context).password,
      icon: CupertinoIcons.lock_fill,
      controller: TextEditingController(),
      isPassword: true,
      onChanged: (_) {},
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPasswordFlow()),
        ),
        child: Text(
          S.of(context).forgotPassword,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${S.of(context).noAccount} ',
        style: Theme.of(context).textTheme.labelLarge,
        children: <TextSpan>[
          TextSpan(
            text: S.of(context).signUpPrompt,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, '/sign-up');
              },
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.globalHorizontal),
      child: CustomButton(
        text: S.of(context).loginButton,
        onPressed: () {
          Navigator.pushNamed(context, '/sign-up');
        },
      ),
    );
  }
}
