import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_check_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class GendaStep extends StatefulWidget {
  final VoidCallback onNext;
  const GendaStep({super.key, required this.onNext});

  @override
  State<GendaStep> createState() => _GendaStepState();
}

class _GendaStepState extends State<GendaStep> {
  bool _isWomanSelected = false;
  bool _isManSelected = false;

  void _toggleSelection(String gender) {
    setState(() {
      if (gender == "woman") {
        _isWomanSelected = !_isWomanSelected;
        _isManSelected = false;
      } else if (gender == "man") {
        _isManSelected = !_isManSelected;
        _isWomanSelected = false;
      }
    });
  }

  Icon? get _selectedGenderIcon {
    if (_isWomanSelected) {
      return const Icon(Icons.female, color: Colors.pink, size: 28);
    } else if (_isManSelected) {
      return const Icon(Icons.male, color: Colors.blue, size: 28);
    }
    return null;
  }

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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).gendaHeader,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (_selectedGenderIcon != null) _selectedGenderIcon!,
              ],
            ),
            const SizedBox(height: 34),
            CheckButton(
              text: S.of(context).male,
              icon: Icons.male,
              iconColor: Colors.blue,
              isSelected: _isManSelected,
              onPressed: () => _toggleSelection("man"),
            ),
            const SizedBox(height: 16),
            CheckButton(
              text: S.of(context).female,
              icon: Icons.female,
              iconColor: Colors.pink,
              isSelected: _isWomanSelected,
              onPressed: () => _toggleSelection("woman"),
            ),
            const Spacer(),
            CustomButton(
              text: S.of(context).continuee,
              onPressed: () {
                if (_isWomanSelected || _isManSelected) {
                  widget.onNext();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
