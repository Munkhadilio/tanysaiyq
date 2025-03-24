import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/messages/chat_screen.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({super.key});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, String>> _activeChats = [
    {"name": "Алихан", "lastMessage": "Привет, как дела?"},
    {"name": "Диана", "lastMessage": "Когда встретимся?"},
    {"name": "Аскар", "lastMessage": "Отправлю файлы завтра."},
  ];
  final List<Map<String, String>> _archivedChats = [
    {"name": "Камила", "lastMessage": "Спасибо за помощь!"},
    {"name": "Рустем", "lastMessage": "До встречи на мероприятии."},
  ];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).messagesTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: S.of(context).activeTab),
            Tab(text: S.of(context).archivedTab),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppStyles.globalHorizontal),
            child: CupertinoTextField(
              placeholder: S.of(context).searchPlaceholder,
              style: Theme.of(context).textTheme.bodyMedium,
              padding: const EdgeInsets.all(12.0),
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(CupertinoIcons.search),
              ),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5,
                borderRadius: BorderRadius.circular(8.0),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildChatList(
                  _activeChats.where((chat) {
                    return chat["name"]!.toLowerCase().contains(_searchQuery);
                  }).toList(),
                ),
                _buildChatList(
                  _archivedChats.where((chat) {
                    return chat["name"]!.toLowerCase().contains(_searchQuery);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList(List<Map<String, String>> chats) {
    if (chats.isEmpty) {
      return Center(
        child: Text(S.of(context).noChats),
      );
    }
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: AppStyles.globalHorizontal),
          leading: CircleAvatar(
            child: Text(chat["name"]![0]),
          ),
          title: Text(chat["name"]!,
              style: Theme.of(context).textTheme.headlineSmall),
          subtitle: Text(chat["lastMessage"]!,
              style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                  builder: (_) => ChatScreen(
                      chatTitle: S.of(context).chatWith(chat["name"]!))),
            );
          },
        );
      },
    );
  }
}
