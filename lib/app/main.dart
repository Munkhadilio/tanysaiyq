import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/bloc/theme/theme_locale.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/home/home_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart' as timeago_ru;
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/app/config/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanysaiyq/views/main_tab_bar.dart';

Future<bool> checkAuthStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('auth') ?? false;
}

void main() {
  // timeago.setLocaleMessages('ru', timeago_ru.RuMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => LocaleCubit(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, Locale>(builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: locale,
              title: 'Tanysaiyq',
              theme: state.isDark ? darkTheme : lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              routes: appRoutes,
              home: FutureBuilder<bool>(
                future: checkAuthStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError ||
                      !snapshot.hasData ||
                      !snapshot.data!) {
                    return const HomeScreen();
                  } else {
                    return const MainTabView();
                  }
                },
              ),
            );
          });
        }));
  }
}
