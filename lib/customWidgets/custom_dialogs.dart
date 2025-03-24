import 'package:flutter/material.dart';

void showSingleColumnSelectionDialog({
  required BuildContext context,
  required String title,
  required List<String> options,
  required String currentSelection,
  required Function(String) onSelectionChanged,
  List<IconData>? icons,
  List<Color>? iconColors,
  bool isContentFlexible = true,
}) {
  showCustomBottomSheet(
    context: context,
    title: title,
    isContentFlexible: isContentFlexible,
    content: ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = option == currentSelection;
        final icon =
            icons != null && icons.length > index ? icons[index] : null;
        final iconColor = iconColors != null && iconColors.length > index
            ? iconColors[index]
            : null;

        return ListTile(
          leading: icon != null ? Icon(icon, color: iconColor) : null,
          title: Text(option, style: Theme.of(context).textTheme.bodyMedium),
          trailing:
              isSelected ? const Icon(Icons.check, color: Colors.green) : null,
          onTap: () {
            onSelectionChanged(option);
            Navigator.pop(context);
          },
        );
      },
    ),
    onSave: () {
      Navigator.pop(context);
    },
  );
}

void showCustomBottomSheet({
  required BuildContext context,
  String? title,
  required Widget content,
  VoidCallback? onSave,
  bool showHeader = true,
  bool isContentFlexible = false,
}) {
  // final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // backgroundColor: isDarkTheme ? Colors.black : Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      final double maxHeight = MediaQuery.of(context).size.height * 0.5;

      return Container(
        constraints:
            isContentFlexible ? null : BoxConstraints(maxHeight: maxHeight),
        margin: isContentFlexible
            ? const EdgeInsets.all(16)
                .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 32)
            : const EdgeInsets.all(16)
                .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: isContentFlexible ? MainAxisSize.min : MainAxisSize.max,
          children: [
            if (showHeader)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (onSave != null)
                        BackButton(color: Theme.of(context).iconTheme.color),
                      if (title != null)
                        Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      onSave != null
                          ? TextButton(
                              onPressed: onSave,
                              child: Text("Готово",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                            )
                          : IconButton(
                              icon: Icon(Icons.close,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () => Navigator.pop(context),
                            ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            content,
          ],
        ),
      );
    },
  );
}
