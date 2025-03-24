import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgGirlsList = [
    'assets/images/girl1.jpg',
    'assets/images/girl2.jpg',
    'assets/images/girl3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      backgroundColor: isDarkTheme
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              _buildImageCarousel(),
              const SizedBox(height: 34),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildQuotes(context),
              // _buildCarouselIndicator(),
              const Spacer(),
              _buildCreateAccountButton(),
              const SizedBox(height: 20),
              _buildSignInButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider(
      items: imgGirlsList
          .map(
            (e) => Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  e,
                  width: 235,
                  height: 360,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        initialPage: 0,
        height: 360,
        viewportFraction: 0.6,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.29,
        scrollDirection: Axis.horizontal,
        autoPlayInterval: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildHeader() {
    return Text("Tanysaiyq", style: Theme.of(context).textTheme.headlineMedium);
  }

  Widget _buildQuotes(BuildContext context) {
    final List<String> quotesList = [
      S.of(context).quote,
    ];

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.globalHorizontal),
      child: Text(
        quotesList[0],
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.globalHorizontal),
      child: CustomButton(
        text: S.of(context).createAccount,
        onPressed: () {
          Navigator.pushNamed(context, '/sign-up');
        },
      ),
    );
  }

  Widget _buildSignInButton() {
    return RichText(
      text: TextSpan(
        text: '${S.of(context).alreadyHaveAnAccount} ',
        style: Theme.of(context).textTheme.labelLarge,
        children: <TextSpan>[
          TextSpan(
            text: S.of(context).login,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/login');
              },
          ),
        ],
      ),
    );
  }
}
