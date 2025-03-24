import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Container(
            margin: const EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: children
                  .asMap()
                  .entries
                  .map(
                    (entry) => Column(
                      children: [
                        if (entry.key > 0)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(
                                thickness: 1,
                                color: isDarkTheme
                                    ? Colors.black45
                                    : Colors.grey[300],
                                height: 1),
                          ),
                        entry.value,
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? value;
  final Color? color;
  final void Function()? onPressed;
  final List<String>? popupOptions;
  final void Function(String)? onPopupSelected;

  const SettingsTile({
    super.key,
    this.icon,
    this.color,
    required this.title,
    this.value,
    this.onPressed,
    this.popupOptions,
    this.onPopupSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onPressed!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyles.globalHorizontal,
          vertical: 12,
        ),
        child: Row(
          children: [
            if (icon != null)
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color ?? Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
            ),
            if (value != null)
              Text(
                value!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            const Icon(
              CupertinoIcons.chevron_forward,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final Color color;
  final void Function(bool) onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyles.globalHorizontal,
        vertical: 12,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class CustomSettingsInput extends StatelessWidget {
  final String label;
  final String value;
  final bool isEditable;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CustomSettingsInput({
    super.key,
    required this.label,
    required this.value,
    this.isEditable = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
        ),
        GestureDetector(
          onTap: isEditable ? null : onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: isEditable
                      ? TextField(
                          controller: controller,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                          ),
                        )
                      : Text(
                          value,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                ),
                if (!isEditable) const Icon(CupertinoIcons.chevron_forward),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
