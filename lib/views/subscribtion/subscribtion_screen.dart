import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class SubscribtionSlider extends StatefulWidget {
  const SubscribtionSlider({super.key});

  @override
  State<SubscribtionSlider> createState() => _SubscribtionSliderState();
}

class _SubscribtionSliderState extends State<SubscribtionSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subscriptions = [
      {
        'name': S.of(context).subscriptionNames_plus,
        'price': "${'1400 ₸ / ' + S.of(context).month}",
        'description': S.of(context).subscriptionDescriptions_plus,
        'features': [
          {
            'name': S.of(context).subscriptionFeatures_unlimitedLikes,
            'isAvailable': true
          },
          {
            'name': S.of(context).subscriptionFeatures_noAds,
            'isAvailable': true
          },
          {
            'name': S.of(context).subscriptionFeatures_superLike,
            'isAvailable': false
          },
        ],
        'isRecommended': true,
      },
      {
        'name': S.of(context).subscriptionNames_premium,
        'price': "${'1800 ₸ / ' + S.of(context).month}",
        'description': S.of(context).subscriptionDescriptions_premium,
        'features': [
          {
            'name': S.of(context).subscriptionFeatures_unlimitedLikes,
            'isAvailable': true
          },
          {
            'name': S.of(context).subscriptionFeatures_noAds,
            'isAvailable': true
          },
          {
            'name': S.of(context).subscriptionFeatures_messaging,
            'isAvailable': true
          },
          {
            'name': S.of(context).subscriptionFeatures_superLike,
            'isAvailable': true
          },
          {
            'name': S.of(context).subscriptionFeatures_boost,
            'isAvailable': true
          },
        ],
        'isRecommended': false,
      },
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: subscriptions.map((subscription) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: subscription['isRecommended']
                            ? [Colors.black, Colors.red]
                            : [Colors.black, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (subscription['isRecommended'])
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                S.of(context).recommended,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  subscription['name'],
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                subscription['price'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            subscription['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: subscription['features'].length,
                              itemBuilder: (context, index) {
                                final feature = subscription['features'][index];
                                return Row(
                                  children: [
                                    Icon(
                                      feature['isAvailable']
                                          ? Icons.check
                                          : Icons.clear,
                                      color: feature['isAvailable']
                                          ? Colors.white
                                          : Colors.redAccent,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        feature['name'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                print('Купить: ${subscription['name']}');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                subscription['name'] == 'Tanysaiyq Free'
                                    ? S.of(context).subscriptionFree
                                    : S
                                        .of(context)
                                        .subscriptionBuy(subscription['price']),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildCarouselIndicator(context, subscriptions),
      ],
    );
  }

  Widget _buildCarouselIndicator(BuildContext context, subscriptions) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        subscriptions.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(5),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == _currentPage
                ? Colors.black
                : (isDarkTheme ? Colors.white : Colors.grey),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
