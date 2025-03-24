import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_input.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class ForgotPasswordSheet extends StatelessWidget {
  final TextEditingController phoneController;
  final VoidCallback onNext;

  const ForgotPasswordSheet({
    super.key,
    required this.phoneController,
    required this.onNext,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).forgotPasswordHeader,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).forgotPasswordNoAccount,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 16),
                CustomInput(
                  hint: S.of(context).phoneNumber,
                  icon: CupertinoIcons.phone_fill,
                  controller: phoneController,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: S.of(context).continuee,
                  onPressed: onNext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
