import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/auth/signup_steps/photo_step.dart';
import 'package:tanysaiyq/views/auth/signup_steps/sign_up_step.dart';
import 'package:tanysaiyq/views/auth/signup_steps/about_step.dart';
import 'package:tanysaiyq/views/auth/signup_steps/genda_step.dart';
import 'package:tanysaiyq/views/auth/signup_steps/habits_pref_step.dart';
import 'package:tanysaiyq/views/auth/signup_steps/interests_step.dart';
import 'package:tanysaiyq/views/auth/signup_steps/profile_details_step.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  void _goToNextStep() {
    if (_currentStep < 7) {
      setState(() {
        _currentStep++;
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      Navigator.pop(context);
    }
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
                onPressed: _goToPreviousStep,
              ),
              if (_currentStep == 3 || _currentStep == 4)
                TextButton(
                  onPressed: _goToNextStep,
                  child: Text(
                    S.of(context).skip,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? null : Colors.grey),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SignUpStep(
            onNext: _goToNextStep,
          ),
          ProfileDetailsStep(
            onNext: _goToNextStep,
          ),
          GendaStep(onNext: _goToNextStep),
          YourInterestsStep(
            onNext: _goToNextStep,
          ),
          HabitsPreferencesStep(
            onNext: _goToNextStep,
          ),
          AddPhotoStep(
            onNext: _goToNextStep,
          ),
          WriteAboutYourselfStep(onNext: _goToNextStep),
        ],
      ),
    );
  }
}
