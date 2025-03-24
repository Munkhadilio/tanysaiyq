import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';

class HabitsQuestionSelection extends StatefulWidget {
  final Map<String, String> selectedDetails;
  final Function(Map<String, String>) onDetailsChanged;

  const HabitsQuestionSelection({
    super.key,
    required this.selectedDetails,
    required this.onDetailsChanged,
  });

  @override
  State<HabitsQuestionSelection> createState() =>
      _HabitsQuestionSelectionState();
}

class _HabitsQuestionSelectionState extends State<HabitsQuestionSelection> {
  final List<HabitsQuestion> _questions = [
    HabitsQuestion(
      title: "Курите?",
      options: ["Курю", "Не курю"],
    ),
    HabitsQuestion(
      title: "Алкоголь?",
      options: ["Не пью", "Пью", "Иногда"],
    ),
    HabitsQuestion(
      title: "Какой у вас рост?",
      options: ["Меньше 150 см", "150-160 см", "161-170 см", "Выше 170 см"],
    ),
  ];

  late Map<String, String> _selectedDetails;

  @override
  void initState() {
    super.initState();
    _selectedDetails = Map<String, String>.from(widget.selectedDetails);
  }

  void _selectOption(String questionTitle, String option) {
    setState(() {
      _selectedDetails[questionTitle] = option;
    });
    widget.onDetailsChanged(_selectedDetails);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return ListView.builder(
      itemCount: _questions.length,
      itemBuilder: (context, index) {
        final question = _questions[index];
        final selectedOption = _selectedDetails[question.title] ?? "";

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: question.options.map((option) {
                final isSelected = selectedOption == option;
                return GestureDetector(
                  onTap: () => _selectOption(question.title, option),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDarkTheme
                            ? (isSelected ? Colors.transparent : Colors.white)
                            : (isSelected ? Colors.grey : Colors.grey),
                        width: 1.0,
                      ),
                      color: isDarkTheme
                          ? (isSelected ? Colors.white : Colors.transparent)
                          : (isSelected ? Colors.grey.shade500 : Colors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      option,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDarkTheme
                              ? isSelected
                                  ? Colors.black
                                  : Colors.white
                              : isSelected
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class HabitsQuestion {
  final String title;
  final List<String> options;

  HabitsQuestion({
    required this.title,
    required this.options,
  });
}
