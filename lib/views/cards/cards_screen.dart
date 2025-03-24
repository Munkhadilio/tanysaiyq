import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/cards/cards_filter.dart';
import 'package:tanysaiyq/views/cards/cards_profile_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final _controller = PageController(initialPage: 0);
  int numberPhotos = 4;
  int currentPhoto = 0;
  late MatchEngine _matchEngine;

  final List<Map<String, String>> userInterests = [
    {'interest': 'Programming', 'emoji': '💻'},
    {'interest': 'Education', 'emoji': '📚'},
    {'interest': 'Music', 'emoji': '🎵'},
    {'interest': 'Travel', 'emoji': '✈️'},
  ];

  List<SwipeItem> items = [
    SwipeItem(
      content: "Liz",
      likeAction: () => log("Like"),
      nopeAction: () => log("Nope"),
      superlikeAction: () => log("Superlike"),
      onSlideUpdate: (SlideRegion? region) async => log("Region $region"),
    ),
    SwipeItem(
      content: "Liz",
      likeAction: () => log("Like"),
      nopeAction: () => log("Nope"),
      superlikeAction: () => log("Superlike"),
      onSlideUpdate: (SlideRegion? region) async => log("Region $region"),
    ),
    SwipeItem(
      content: "Liz",
      likeAction: () => log("Like"),
      nopeAction: () => log("Nope"),
      superlikeAction: () => log("Superlike"),
      onSlideUpdate: (SlideRegion? region) async => log("Region $region"),
    )
  ];

  @override
  void initState() {
    _matchEngine = MatchEngine(swipeItems: items);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
              left: AppStyles.globalHorizontal,
              right: AppStyles.globalHorizontal,
              bottom: AppStyles.globalVertical),
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  upSwipeAllowed: true,
                  onStackFinished: () {},
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Hero(
                        tag: "imageTag$index",
                        child: Material(
                          type: MaterialType.transparency,
                          child: Stack(
                            children: [
                              _buildCardBackground(),
                              _buildGradientOverlay(),
                              _buildTapZones(),
                              _buildPhotoIndicators(),
                              _buildCardFooter(index),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Tanysaiyq",
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon:
              Icon(Icons.filter_list, color: Theme.of(context).iconTheme.color),
          onPressed: () => _showFilterBottomSheet(context),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildCardBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/girl1.jpg'),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
    );
  }

  Widget _buildTapZones() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (currentPhoto != 0) {
                setState(() => currentPhoto--);
              }
            },
            child: Container(color: Colors.transparent),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (currentPhoto < (numberPhotos - 1)) {
                setState(() => currentPhoto++);
              }
            },
            child: Container(color: Colors.transparent),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoIndicators() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: SizedBox(
          width: double.infinity,
          height: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(numberPhotos, (index) {
              bool isActive = currentPhoto == index;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isActive
                          ? Colors.white
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildCardFooter(int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(items[index].content + ",",
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(width: 5),
                  Text("25", style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: userInterests
                          .take(4)
                          .map(
                            (interest) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    interest['emoji']!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    interest['interest']!,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  _buildOpenProfileButton(index)
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '1 ${S.of(context).km}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(Icons.close, Colors.orange, 30, () {
            log("Rejected");
            _matchEngine.currentItem?.nope();
          }),
          _buildActionButton(Icons.favorite, Colors.pink, 40, () {
            log("Liked");
            _matchEngine.currentItem?.like();
          }),
          _buildActionButton(Icons.star, Colors.purple, 30, () {
            log("Superliked");
            _matchEngine.currentItem?.superLike();
          }),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, Color color, double size, VoidCallback onTap) {
    return Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: CircleAvatar(
            radius: size,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(icon, color: color, size: size),
          ),
        ));
  }

  Widget _buildOpenProfileButton(index) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return Align(
      alignment: Alignment.bottomRight,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => pushScreen(
            context,
            pageTransitionAnimation: PageTransitionAnimation.slideUp,
            withNavBar: false,
            screen: CardsProfileScreen(index: index),
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(
              CupertinoIcons.arrowtriangle_up_fill,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (_) => CardsFilterFilterBottomSheet(
              initialMinAge: 18,
              initialMaxAge: 100,
              initialMaxDistance: 50,
              initialGender: "Любой",
              onApply: (minAge, maxAge, maxDistance, gender) {
                log("Age: $minAge-$maxAge, Distance: $maxDistance, Gender: $gender");
              },
            ));
  }
}
