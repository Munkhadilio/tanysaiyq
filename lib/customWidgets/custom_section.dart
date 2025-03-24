import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';

class CustomSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const CustomSection({
    super.key,
    this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: title != null ? 0 : 8,
          right: AppStyles.globalHorizontal,
          left: AppStyles.globalHorizontal,
          bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child:
                  Text(title!, style: Theme.of(context).textTheme.bodyMedium),
            ),
          Column(
            children: children
                .asMap()
                .entries
                .map(
                  (entry) => Column(
                    children: [
                      entry.value,
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
