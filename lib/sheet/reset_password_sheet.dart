import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_input.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class ResetPasswordSheet extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onConfirm;

  const ResetPasswordSheet({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.globalHorizontal),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).passwordHeader,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              CustomInput(
                hint: S.of(context).passwordnewPassword,
                icon: CupertinoIcons.lock_fill,
                isPassword: true,
                controller: passwordController,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomInput(
                hint: S.of(context).passwordconfirmPassword,
                icon: CupertinoIcons.lock_fill,
                isPassword: true,
                controller: confirmPasswordController,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: S.of(context).confirmButton,
                onPressed: onConfirm,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
