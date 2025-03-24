import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class WriteAboutYourselfStep extends StatefulWidget {
  final VoidCallback onNext;
  const WriteAboutYourselfStep({super.key, required this.onNext});

  @override
  State<WriteAboutYourselfStep> createState() => _WriteAboutYourselfStepState();
}

class _WriteAboutYourselfStepState extends State<WriteAboutYourselfStep> {
  bool _continueMainTabView = false;
  String textAboutYourself = "";

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.globalHorizontal,
            vertical: AppStyles.globalVertical),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      textAboutYourself = value;
                    });
                  },
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  minLines: 15,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: S.of(context).writeAboutYourselfHintText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          color: isDarkTheme
                              ? Colors.white
                              : CupertinoColors.systemGrey3,
                          width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDarkTheme
                            ? Colors.white
                            : CupertinoColors.systemGrey3,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDarkTheme
                            ? Colors.white
                            : CupertinoColors.systemGrey3,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: S.of(context).continuee,
                  onPressed: () {
                    if (textAboutYourself.isNotEmpty) {
                      setState(() {
                        _continueMainTabView = true;
                      });
                      widget.onNext();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).writeAboutYourselfHeader,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
