import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';

Widget buildCustomTile({
  required BuildContext context,
  required IconData icon,
  required String title,
  String? value,
  required VoidCallback onPressed,
  Color? iconColor,
}) {
  final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: iconColor ?? Colors.blue, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (value != null)
            Expanded(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          const SizedBox(width: 8),
          const Icon(
            CupertinoIcons.chevron_forward,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

Widget buildSelectionBlock({
  required BuildContext context,
  required String title,
  required String value,
  required IconData icon,
  Color? iconColor,
  required VoidCallback onPressed,
  required List<String> selectedItems,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildCustomTile(
        context: context,
        icon: icon,
        iconColor: iconColor,
        title: title,
        onPressed: onPressed,
      ),
      if (selectedItems.isNotEmpty)
        Wrap(
          spacing: 8.0,
          children: selectedItems
              .map((item) => Chip(
                  label:
                      Text(item, style: Theme.of(context).textTheme.bodySmall)))
              .toList(),
        ),
    ],
  );
}
