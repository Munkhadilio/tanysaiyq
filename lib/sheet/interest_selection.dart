import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'dart:math';

class InterestSelection extends StatefulWidget {
  final Set<String> selectedInterests;
  final Function(Set<String>) onSelectionChanged;

  const InterestSelection({
    super.key,
    required this.selectedInterests,
    required this.onSelectionChanged,
  });

  @override
  State<InterestSelection> createState() => _InterestSelectionWidgetState();
}

class _InterestSelectionWidgetState extends State<InterestSelection> {
  final List<Map<String, dynamic>> _categories = [
    {"text": "Photography", "icon": Icons.camera},
    {"text": "Karaoke", "icon": Icons.mic},
    {"text": "Cooking", "icon": Icons.kitchen},
    {"text": "Run", "icon": Icons.run_circle},
    {"text": "Art", "icon": Icons.brush},
    {"text": "Extreme", "icon": Icons.flash_on},
    {"text": "Drink", "icon": Icons.local_drink},
    {"text": "Shopping", "icon": Icons.shopping_bag},
    {"text": "Yoga", "icon": Icons.self_improvement},
    {"text": "Tennis", "icon": Icons.sports_tennis},
    {"text": "Swimming", "icon": Icons.pool},
    {"text": "Traveling", "icon": Icons.flight_takeoff},
    {"text": "Music", "icon": Icons.music_note},
    {"text": "Video games", "icon": Icons.gamepad},
  ];

  late Set<String> _selectedCategories;
  final Map<String, Color> _selectedColors = {};

  @override
  void initState() {
    super.initState();
    _selectedCategories = widget.selectedInterests.toSet();
  }

  Color getRandomColor() {
    final random = Random();
    final colorOptions = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
    ];

    return colorOptions[random.nextInt(colorOptions.length)];
  }

  void _toggleSelection(String interest) {
    setState(() {
      if (_selectedCategories.contains(interest)) {
        _selectedCategories.remove(interest);
        _selectedColors.remove(interest);
      } else {
        _selectedCategories.add(interest);
        _selectedColors[interest] =
            _selectedColors.putIfAbsent(interest, getRandomColor);
      }
    });
    widget.onSelectionChanged(_selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cellWidth = (screenWidth - 50) / 2;
    const cellHeight = 50.0;
    final aspectRatio = cellWidth / cellHeight;
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: aspectRatio,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        final isSelected = _selectedCategories.contains(category["text"]);
        final iconColor =
            _selectedColors.putIfAbsent(category["text"], getRandomColor);
        return GestureDetector(
          onTap: () => _toggleSelection(category["text"]),
          child: Container(
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
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category["icon"],
                  color: isSelected
                      ? iconColor
                      : (isDarkTheme ? Colors.white : Colors.grey),
                ),
                const SizedBox(width: 8),
                Text(
                  category["text"],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDarkTheme
                          ? isSelected
                              ? Colors.black
                              : Colors.white
                          : isSelected
                              ? Colors.white
                              : Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
