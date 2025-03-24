import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/sheet/habits_selection.dart';

class HabitsPreferencesStep extends StatefulWidget {
  final VoidCallback onNext;
  const HabitsPreferencesStep({super.key, required this.onNext});

  @override
  State<HabitsPreferencesStep> createState() => _HabitsPreferencesStepState();
}

class _HabitsPreferencesStepState extends State<HabitsPreferencesStep> {
  Map<String, String> selectedDetails = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.globalHorizontal,
            vertical: AppStyles.globalVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            _buildSubheader(context),
            const SizedBox(height: 16),
            Expanded(
              child: HabitsQuestionSelection(
                selectedDetails: selectedDetails,
                onDetailsChanged: (updatedDetails) {
                  setState(() {
                    selectedDetails = updatedDetails;
                  });
                },
              ),
            ),
            CustomButton(
              text: S.of(context).continuee,
              onPressed: widget.onNext,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).habitsHeader,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _buildSubheader(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Text(
      S.of(context).habitsSubheader,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: isDarkTheme ? null : Colors.grey),
    );
  }
}
