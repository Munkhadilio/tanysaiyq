import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanysaiyq/views/cards/cards_screen.dart';
import 'package:tanysaiyq/views/matches/all_matches_screen.dart';
import 'package:tanysaiyq/views/messages/all_chats_screen.dart';
import 'package:tanysaiyq/views/profile/current_profile_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CardsScreen(),
    AllMatchesScreen(),
    const AllChatsScreen(),
    const CurrentUserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.house_fill,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              return _widgetOptions.elementAt(index);
            },
          );
        },
      ),
    );
  }
}
