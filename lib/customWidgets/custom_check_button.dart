import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';

class CheckButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? iconColor;

  const CheckButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isDarkTheme
              ? (isSelected ? Colors.white : Colors.black)
              : (isSelected ? Colors.grey.shade500 : Colors.white),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: isDarkTheme
                    ? (isSelected ? Colors.white : Colors.white)
                    : isSelected
                        ? Colors.grey
                        : Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            const SizedBox(width: 8),
            Text(text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme
                        ? isSelected
                            ? Colors.black
                            : Colors.white
                        : isSelected
                            ? Colors.white
                            : Colors.black)),
          ],
        ),
      ),
    );
  }
}
