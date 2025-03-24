import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_settings.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/profile/current_profile_edit_screen.dart';
import 'package:tanysaiyq/views/settings/settings_screen.dart';
import 'package:tanysaiyq/views/subscribtion/subscribtion_screen.dart';

class CurrentUserProfileScreen extends StatefulWidget {
  const CurrentUserProfileScreen({super.key});

  @override
  State<CurrentUserProfileScreen> createState() =>
      _CurrentUserProfileScreenState();
}

class _CurrentUserProfileScreenState extends State<CurrentUserProfileScreen> {
  final String userName = 'Адильжан';
  final String userAge = '24';
  final String userGender = 'Мужской';
  final String userAvatarUrl = 'assets/images/me.jpg';

  final double profileCompletion = 0.75;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).profileTitle,
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.gear),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: AppStyles.globalVertical,
                      left: AppStyles.globalHorizontal,
                      right: AppStyles.globalHorizontal),
                  child: Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 8.0,
                        percent: profileCompletion,
                        center: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(userAvatarUrl),
                        ),
                        progressColor:
                            isDarkTheme ? Colors.white : Colors.black,
                        backgroundColor:
                            isDarkTheme ? Colors.black : Colors.grey.shade200,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        animationDuration: 1200,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$userName, $userAge',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CurrentProfileEditScreen(),
                            ),
                          );
                        },
                        icon: const Icon(CupertinoIcons.pencil,
                            color: Colors.blue),
                        label: Text(S.of(context).editProfile),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppStyles.globalVertical),
                    child: const SubscribtionSlider()),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: AppStyles.globalVertical,
                  left: AppStyles.globalHorizontal,
                  right: AppStyles.globalHorizontal),
              child: Column(
                children: [
                  SettingsSection(
                    title: S.of(context).userSafety,
                    children: [
                      SettingsTile(
                        title: S.of(context).onlineDatingTips,
                        onPressed: () {},
                      ),
                      SettingsTile(
                        title: S.of(context).meetingRules,
                        onPressed: () {},
                      ),
                      SettingsTile(
                        title: S.of(context).generalSafety,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
