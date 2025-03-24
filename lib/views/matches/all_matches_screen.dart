import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/cards/cards_profile_screen.dart';
import 'package:tanysaiyq/views/matches/match_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class KzMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'бұрын';
  @override
  String suffixFromNow() => 'кейін';
  @override
  String lessThanOneMinute(int seconds) => 'бір минуттан аз';
  @override
  String aboutAMinute(int minutes) => 'минут';
  @override
  String minutes(int minutes) => '$minutes минут';
  @override
  String aboutAnHour(int minutes) => 'сағат';
  @override
  String hours(int hours) => '$hours сағат';
  @override
  String aDay(int hours) => 'күн';
  @override
  String days(int days) => '$days күн';
  @override
  String aboutAMonth(int days) => 'ай';
  @override
  String months(int months) => '$months ай';
  @override
  String aboutAYear(int year) => 'жыл';
  @override
  String years(int years) => '$years жыл';
  @override
  String wordSeparator() => ' ';
}

class Match {
  final String id;
  final String name;
  final String age;
  final String image;
  final DateTime date;
  final bool isMatch;

  Match({
    required this.id,
    required this.name,
    required this.age,
    required this.image,
    required this.date,
    this.isMatch = false,
  });
}

class AllMatchesScreen extends StatelessWidget {
  AllMatchesScreen({super.key}) {
    timeago.setLocaleMessages('kz', KzMessages());
  }

  final List<Match> matches = [
    Match(
      id: '1',
      name: "Лейлани",
      age: "19",
      image: "assets/images/girl1.jpg",
      isMatch: true,
      date: DateTime.now(),
    ),
    Match(
      id: '2',
      name: "Лейлани",
      age: "19",
      image: "assets/images/girl1.jpg",
      date: DateTime.now(),
    ),
    Match(
      id: '3',
      name: "Лейлани",
      age: "19",
      image: "assets/images/girl1.jpg",
      date: DateTime.now(),
    ),
    Match(
      id: '4',
      name: "Аннабель",
      age: "20",
      image: "assets/images/girl2.jpg",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Match(
      id: '5',
      name: "Аннабель",
      age: "20",
      image: "assets/images/girl2.jpg",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Match(
      id: '6',
      name: "Аннабель",
      age: "20",
      image: "assets/images/girl2.jpg",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Match(
      id: '7',
      name: "Аннабель",
      age: "20",
      image: "assets/images/girl2.jpg",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Match(
      id: '8',
      name: "Рейган",
      age: "24",
      image: "assets/images/girl3.jpg",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Match(
      id: '9',
      name: "Хэдли",
      age: "25",
      image: "assets/images/girl1.jpg",
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Match(
      id: '10',
      name: "Камилла",
      age: "22",
      image: "assets/images/girl1.jpg",
      date: DateTime.now().subtract(const Duration(days: 10)),
    ),
    Match(
      id: '11',
      name: "София",
      age: "26",
      image: "assets/images/girl3.jpg",
      date: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).matchScreenTitle),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).tabLikes),
              Tab(text: S.of(context).tabMatches),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGroupedMatches(
              context,
              matches.where((match) => !match.isMatch).toList(),
              S.of(context).noLikes,
            ),
            _buildGroupedMatches(
              context,
              matches.where((match) => match.isMatch).toList(),
              S.of(context).noMatches,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupedMatches(
      BuildContext context, List<Match> matchesList, String emptyMessage) {
    if (matchesList.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
        ),
      );
    }

    final groupedMatches = _groupMatchesByDate(context, matchesList);

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyles.globalHorizontal,
        vertical: AppStyles.globalVertical,
      ),
      children: groupedMatches.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, entry.key),
            _buildMatchesGrid(context, entry.value),
          ],
        );
      }).toList(),
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).toString();
    String formattedDate = timeago.format(date, locale: locale);
    if (formattedDate.isNotEmpty) {
      formattedDate =
          formattedDate[0].toUpperCase() + formattedDate.substring(1);
    }
    return formattedDate;
  }

  Map<String, List<Match>> _groupMatchesByDate(
      BuildContext context, List<Match> matches) {
    final Map<String, List<Match>> grouped = {};

    for (var match in matches) {
      final dateKey = _formatDate(context, match.date);
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(match);
    }

    return grouped;
  }

  Widget _buildSectionTitle(BuildContext context, title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildMatchesGrid(BuildContext context, List<Match> matches) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final match = matches[index];
        return _buildMatchCard(context, match);
      },
    );
  }

  Widget _buildMatchCard(BuildContext context, Match match) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: () {
          if (match.isMatch) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => const MatchScreen(),
              ),
            );
          } else {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) => CardsProfileScreen(
                  id: match.id,
                  showCloseButton: false,
                ),
              ),
            );
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(match.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: match.isMatch ? Colors.pink : Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                            match.isMatch
                                ? S.of(context).matchLabel
                                : S.of(context).likeLabel,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text("${match.name}, ${match.age}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
