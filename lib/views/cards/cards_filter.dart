import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class CardsFilterFilterBottomSheet extends StatefulWidget {
  final double initialMinAge;
  final double initialMaxAge;
  final double initialMaxDistance;
  final String initialGender;
  final Function(
      double minAge, double maxAge, double maxDistance, String gender) onApply;

  const CardsFilterFilterBottomSheet({
    super.key,
    required this.initialMinAge,
    required this.initialMaxAge,
    required this.initialMaxDistance,
    required this.initialGender,
    required this.onApply,
  });

  @override
  State<CardsFilterFilterBottomSheet> createState() =>
      _CardsFilterFilterBottomSheetState();
}

class _CardsFilterFilterBottomSheetState
    extends State<CardsFilterFilterBottomSheet> {
  late double minAge;
  late double maxAge;
  late double maxDistance;
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    minAge = widget.initialMinAge;
    maxAge = widget.initialMaxAge;
    maxDistance = widget.initialMaxDistance;
    selectedGender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).filterTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      minAge = widget.initialMinAge;
                      maxAge = widget.initialMaxAge;
                      maxDistance = widget.initialMaxDistance;
                      selectedGender = widget.initialGender;
                    });
                  },
                  child: Text(S.of(context).clear,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildGenderFilter(),
            const SizedBox(height: 24),
            _buildDistanceFilter(),
            const SizedBox(height: 24),
            _buildAgeFilter(),
            const SizedBox(height: 24),
            const CustomButton(text: "Продолжить")
          ],
        ),
      ),
    );
  }

  Widget _buildGenderFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).interestedIn,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildGenderButton(S.of(context).genderGirls,
                isLeft: true, isRight: false),
            _buildGenderButton(S.of(context).genderBoys,
                isLeft: false, isRight: false),
            _buildGenderButton(S.of(context).genderBoth,
                isLeft: false, isRight: true),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String gender,
      {required bool isLeft, required bool isRight}) {
    final isSelected = selectedGender == gender;

    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Expanded(
        child: GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isDarkTheme
              ? (isSelected ? Colors.white : Colors.black)
              : (isSelected ? Colors.black : Colors.white),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(
            topLeft: isLeft ? const Radius.circular(10) : Radius.zero,
            bottomLeft: isLeft ? const Radius.circular(10) : Radius.zero,
            topRight: isRight ? const Radius.circular(10) : Radius.zero,
            bottomRight: isRight ? const Radius.circular(10) : Radius.zero,
          ),
        ),
        child: Text(
          gender,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isDarkTheme
                    ? (isSelected ? Colors.black : Colors.white)
                    : (isSelected ? Colors.white : Colors.black),
              ),
        ),
      ),
    ));
  }

  Widget _buildDistanceFilter() {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).distance,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: isDarkTheme ? Colors.white : Colors.black,
                    thumbColor: isDarkTheme ? Colors.white : Colors.black,
                    overlayColor: Colors.black.withOpacity(0.2),
                    inactiveTrackColor:
                        isDarkTheme ? Colors.black : Colors.white,
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent),
                child: Slider(
                  value: maxDistance,
                  min: 5,
                  max: 100,
                  divisions: 19,
                  label: "${maxDistance.toInt()} ${S.of(context).km}",
                  onChanged: (value) => setState(() => maxDistance = value),
                ),
              ),
            ),
            Text("${maxDistance.toInt()} ${S.of(context).km}",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }

  Widget _buildAgeFilter() {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).age,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: isDarkTheme ? Colors.white : Colors.black,
                  inactiveTrackColor: isDarkTheme ? Colors.black : Colors.white,
                  thumbColor: isDarkTheme ? Colors.white : Colors.black,
                  overlayColor: Colors.black.withOpacity(0.2),
                  valueIndicatorColor: Colors.black,
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                child: RangeSlider(
                  values: RangeValues(minAge, maxAge),
                  min: 18,
                  max: 100,
                  divisions: 82,
                  labels: RangeLabels(
                    minAge.toInt().toString(),
                    maxAge.toInt().toString(),
                  ),
                  onChanged: (values) {
                    setState(() {
                      minAge = values.start;
                      maxAge = values.end;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
                width: 70,
                child: Text("${minAge.toInt()} - ${maxAge.toInt()}",
                    style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
      ],
    );
  }
}
