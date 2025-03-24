import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class OTPViewSheet extends StatefulWidget {
  final TextEditingController otpController;
  final VoidCallback onNext;

  const OTPViewSheet({
    super.key,
    required this.otpController,
    required this.onNext,
  });

  @override
  State<OTPViewSheet> createState() => _OTPViewSheetState();
}

class _OTPViewSheetState extends State<OTPViewSheet> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    widget.otpController.addListener(() {
      setState(() {
        isButtonEnabled = widget.otpController.text.length == 6;
      });
    });
  }

  void _onOTPCompleted(String otp) {
    print("OTP введен: $otp");
  }

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
                S.of(context).otpHeader,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).otpMessage,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 16),
              Pinput(
                length: 6,
                controller: widget.otpController,
                onCompleted: _onOTPCompleted,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: S.of(context).continuee,
                onPressed: widget.onNext,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
