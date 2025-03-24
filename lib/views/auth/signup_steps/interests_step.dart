import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/sheet/interest_selection.dart';

class YourInterestsStep extends StatefulWidget {
  final VoidCallback onNext;
  const YourInterestsStep({super.key, required this.onNext});

  @override
  State<YourInterestsStep> createState() => _YourInterestsStepState();
}

class _YourInterestsStepState extends State<YourInterestsStep> {
  Set<String> selectedCategories = {};

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
              child: InterestSelection(
                selectedInterests: selectedCategories,
                onSelectionChanged: (newSelection) {
                  setState(() {
                    selectedCategories = newSelection;
                  });
                },
              ),
            ),
            CustomButton(
                text: S.of(context).continuee, onPressed: widget.onNext),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).interestHeader,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _buildSubheader(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Text(
      S.of(context).interestSubheader,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: isDarkTheme ? null : Colors.grey),
    );
  }
}
