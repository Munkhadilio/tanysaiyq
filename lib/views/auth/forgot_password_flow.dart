import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/sheet/forgot_password_sheet.dart';
import 'package:tanysaiyq/sheet/otp_sheet.dart';
import 'package:tanysaiyq/sheet/reset_password_sheet.dart';

class ForgotPasswordFlow extends StatefulWidget {
  const ForgotPasswordFlow({super.key});

  @override
  _ForgotPasswordFlowState createState() => _ForgotPasswordFlowState();
}

class _ForgotPasswordFlowState extends State<ForgotPasswordFlow> {
  final PageController _pageController = PageController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  int _currentPage = 0;

  void _nextPage() {
    setState(() {
      _currentPage++;
    });
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    setState(() {
      _currentPage--;
    });
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      backgroundColor: isDarkTheme
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: isDarkTheme ? Colors.white : Colors.black,
                onPressed: () {
                  if (_currentPage > 0) {
                    _previousPage();
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ForgotPasswordSheet(
              phoneController: _phoneController,
              onNext: _nextPage,
            ),
            OTPViewSheet(
              otpController: _otpController,
              onNext: _nextPage,
            ),
            ResetPasswordSheet(
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
              onConfirm: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
