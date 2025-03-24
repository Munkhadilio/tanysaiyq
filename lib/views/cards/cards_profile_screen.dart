import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class CardsProfileScreen extends StatefulWidget {
  final int? index;
  final String? id;
  final bool showCloseButton;
  const CardsProfileScreen(
      {this.index, this.id, this.showCloseButton = true, super.key});

  @override
  State<CardsProfileScreen> createState() => _CardsProfileScreenState();
}

class _CardsProfileScreenState extends State<CardsProfileScreen> {
  final int numberPhotos = 4;
  int currentPhoto = 0;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.showCloseButton ? AppBar(centerTitle: true) : null,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(
                complete: null,
                failed: null,
                idleIcon: Icon(CupertinoIcons.arrow_down),
                refresh: null,
                waterDropColor: Colors.grey,
              ),
              onRefresh: _onRefresh,
              child: _buildContent(),
            ),
            if (widget.showCloseButton)
              Positioned(
                bottom: 32,
                right: 32,
                child: _buildCloseButton(),
              ),
          ],
        ),
      ),
    );
  }

  void _onRefresh() {
    Navigator.pop(context);
    _refreshController.refreshCompleted();
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPhotoSection(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: AppStyles.globalVertical),
            child: Column(
              children: [
                _buildInfoBlocks([
                  {
                    'name': 'Jessica Parker, 23',
                    'about':
                        'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading, hiking, and spending time outdoors.',
                    'distance': 2,
                  },
                ]),
                const SizedBox(height: 20),
                _buildHabitsSection([
                  {
                    'habit': 'Курение',
                    'status': 'Не курю',
                  },
                  {
                    'habit': 'Алкоголь',
                    'status': 'Иногда',
                  },
                  {
                    'habit': 'Дети',
                    'status': 'Планирую',
                  },
                  {
                    'habit': 'Языки',
                    'status': 'Английский, Русский',
                  },
                  {
                    'habit': 'Знак зодиака',
                    'status': 'Лев',
                  },
                  {'habit': 'Животные', 'status': 'Кошки'},
                  {
                    'habit': 'Религия',
                    'status': 'Атеизм',
                  },
                  {
                    'habit': 'Образование',
                    'status': 'Высшее',
                  },
                  {
                    'habit': 'Характер',
                    'status': 'Открытый',
                  },
                ]),
                const SizedBox(height: 20),
                _buildInterestsSection([
                  Interest(name: 'Programming', icon: CupertinoIcons.macwindow),
                  Interest(name: 'Education', icon: CupertinoIcons.book),
                  Interest(name: 'Music', icon: CupertinoIcons.music_note),
                  Interest(name: 'Travel', icon: CupertinoIcons.airplane),
                  Interest(name: 'Programming', icon: CupertinoIcons.macwindow),
                  Interest(name: 'Education', icon: CupertinoIcons.book),
                  Interest(name: 'Music', icon: CupertinoIcons.music_note),
                  Interest(name: 'Travel', icon: CupertinoIcons.airplane),
                  Interest(name: 'Programming', icon: CupertinoIcons.macwindow),
                  Interest(name: 'Education', icon: CupertinoIcons.book),
                  Interest(name: 'Music', icon: CupertinoIcons.music_note),
                  Interest(name: 'Travel', icon: CupertinoIcons.airplane),
                ]),
                const SizedBox(height: 20),
                _buildQnA([
                  {
                    'question': "What makes you smile?",
                    'answer': "Good food and good company."
                  },
                  {
                    'question': "Your favorite hobby?",
                    'answer': "Playing guitar."
                  },
                  {
                    'question': "Dream travel destination?",
                    'answer': "Japan and Italy."
                  },
                ]),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPhotoIndicators() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(numberPhotos, (index) {
            return _buildIndicatorDot(index == currentPhoto);
          }),
        ),
      ),
    );
  }

  Widget _buildIndicatorDot(bool isActive) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isActive ? Colors.white : Colors.grey.shade500,
          ),
        ),
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
      ),
    );
  }

  Widget _buildCloseButton() {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => Navigator.pop(context),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Icon(
            CupertinoIcons.arrowtriangle_down_fill,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSection() {
    final double height = MediaQuery.of(context).size.height * 0.6;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Hero(
        tag: widget.index != null
            ? "imageTag${widget.index}"
            : "imageTag${widget.id}",
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              _buildMainPhoto(height),
              _buildPhotoNavigationOverlay(),
              _buildPhotoIndicators(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(Icons.close, Colors.orange, 30, () {
                      log("Rejected");
                    }),
                    _buildActionButton(Icons.favorite, Colors.pink, 40, () {
                      log("Liked");
                    }),
                    _buildActionButton(Icons.star, Colors.purple, 30, () {
                      log("Superliked");
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainPhoto(double height) {
    return Container(
      height: height - 35,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/girl1.jpg'),
        ),
      ),
    );
  }

  Widget _buildPhotoNavigationOverlay() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _showPreviousPhoto,
            child: Container(color: Colors.transparent),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: _showNextPhoto,
            child: Container(color: Colors.transparent),
          ),
        ),
      ],
    );
  }

  void _showPreviousPhoto() {
    if (currentPhoto > 0) {
      setState(() => currentPhoto--);
    }
  }

  void _showNextPhoto() {
    if (currentPhoto < numberPhotos - 1) {
      setState(() => currentPhoto++);
    }
  }

  Widget _buildInfoBlocks(List<Map<String, dynamic>> infos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: infos.map((info) {
        return _buildInfoBlock(info['name'], info['about'], info['distance']);
      }).toList(),
    );
  }

  Widget _buildInfoBlock(String name, String about, int distance) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                // const SizedBox(height: 4),
                // const Text(
                //   "Professional model",
                //   style: TextStyle(
                //     fontSize: 14,
                //     color: Colors.black54,
                //   ),
                // ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              CupertinoIcons.location_solid,
              color: Colors.redAccent,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              S.of(context).cardsDistance(distance),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          about,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildInterestsSection(List<Interest> interests) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).cardsInterests,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: interests
              .map((interest) => _buildInterestBlock(interest))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildInterestBlock(Interest interest) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(interest.icon,
                size: 16, color: Theme.of(context).iconTheme.color),
            const SizedBox(width: 6),
            Text(interest.name, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildHabitsSection(List<Map<String, dynamic>> habits) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).cardsDetails,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Column(
          children: habits.map((habit) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "${habit['habit']}: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: habit['status'],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQnA(List<Map<String, String>> qnaList) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).cardsQuestions,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: qnaList.map((qna) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      qna['question']!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      qna['answer']!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Interest {
  final String name;
  final IconData icon;

  Interest({required this.name, required this.icon});
}
