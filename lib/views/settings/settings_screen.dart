import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/bloc/theme/theme_locale.dart';
import 'package:tanysaiyq/customWidgets/custom_dialogs.dart';
import 'package:tanysaiyq/customWidgets/custom_settings.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Настройки"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppStyles.globalHorizontal,
              vertical: AppStyles.globalVertical,
            ),
            child: Column(
              children: [
                SettingsSection(
                  title: S.of(context)!.general,
                  children: [
                    SettingsSwitchTile(
                      icon: CupertinoIcons.moon_stars,
                      color: Colors.black,
                      title: S.of(context)!.darkMode,
                      value: isDarkTheme,
                      onChanged: (value) {
                        context.read<ThemeCubit>().setThemeBrightness(
                            value ? Brightness.dark : Brightness.light);
                      },
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.globe,
                      color: Colors.blue,
                      title: S.of(context)!.language,
                      value: 'Русский',
                      onPressed: () {
                        showSingleColumnSelectionDialog(
                          context: context,
                          title: 'Выберите язык',
                          options: const ['Қазақша', 'Русский', 'English'],
                          currentSelection: 'Русский',
                          onSelectionChanged: (selectedLanguage) {
                            final localeCubit = context.read<LocaleCubit>();
                            if (selectedLanguage == 'Қазақша') {
                              localeCubit.setLocale('kk');
                            } else if (selectedLanguage == 'Русский') {
                              localeCubit.setLocale('ru');
                            } else if (selectedLanguage == 'English') {
                              localeCubit.setLocale('en');
                            }
                            print('Выбран язык: $selectedLanguage');
                          },
                        );
                      },
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.bell,
                      color: Colors.amber,
                      title: S.of(context)!.notifications,
                      onPressed: () {},
                    ),
                  ],
                ),
                SettingsSection(
                  title: S.of(context)!.account,
                  children: [
                    SettingsTile(
                      icon: CupertinoIcons.creditcard,
                      color: Colors.green,
                      title: S.of(context)!.subscription,
                      value:
                          S.of(context).subscriptionDate('Premium', '12.03.12'),
                      onPressed: () {},
                    ),
                    SettingsSwitchTile(
                      icon: CupertinoIcons.power,
                      color: Colors.grey,
                      title: S.of(context)!.hideProfile,
                      value: false,
                      onChanged: (value) {},
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.arrow_left_circle,
                      color: Colors.red,
                      title: S.of(context)!.logOut,
                      onPressed: () {},
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.trash,
                      color: Colors.black,
                      title: S.of(context)!.deleteAccount,
                      onPressed: () {},
                    ),
                  ],
                ),
                SettingsSection(
                  title: S.of(context)!.supportAndHelp,
                  children: [
                    SettingsTile(
                      icon: CupertinoIcons.question_circle,
                      color: Colors.orange,
                      title: S.of(context)!.helpAndSupport,
                      onPressed: () {},
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.lock_shield,
                      color: Colors.blue,
                      title: S.of(context)!.privacyPolicy,
                      onPressed: () {},
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.doc,
                      color: Colors.green,
                      title: S.of(context)!.termsOfUse,
                      onPressed: () {},
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.doc_on_clipboard,
                      color: Colors.purple,
                      title: S.of(context)!.dataProcessingConsent,
                      onPressed: () {},
                    ),
                    SettingsTile(
                      icon: CupertinoIcons.return_icon,
                      color: Colors.red,
                      title: S.of(context)!.refundRight,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
