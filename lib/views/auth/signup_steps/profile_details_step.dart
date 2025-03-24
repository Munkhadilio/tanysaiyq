import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_input.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class ProfileDetailsStep extends StatefulWidget {
  final VoidCallback onNext;
  const ProfileDetailsStep({super.key, required this.onNext});

  @override
  State<ProfileDetailsStep> createState() => _ProfileDetailsStepState();
}

class _ProfileDetailsStepState extends State<ProfileDetailsStep> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime _birthDate = DateTime.now();
  final bool _showDatePicker = false;

  void _selectDate(BuildContext context) async {
    if (!Platform.isIOS) {
      await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 250,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: _birthDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (picked) {
                    setState(() {
                      _birthDate = picked;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: const Text('Готово'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      );
    } else {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _birthDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != _birthDate) {
        setState(() {
          _birthDate = picked;
        });
      }
    }
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
            _buildHeader(context),
            const SizedBox(height: 34),
            CustomInput(
              hint: S.of(context).firstName,
              controller: _firstNameController,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).birthDate,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      child: Row(
                        children: [
                          Text(
                            "${_birthDate.day}/${_birthDate.month}/${_birthDate.year}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.calendar_today,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ],
                      ),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              text: S.of(context).continuee,
              onPressed: _firstNameController.text.isNotEmpty
                  ? () {
                      widget.onNext();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).profileSignUpHeader,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
