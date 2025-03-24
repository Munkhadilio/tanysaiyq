import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  final String chatTitle;

  const ChatScreen({super.key, required this.chatTitle});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final types.User _currentUser = const types.User(id: 'user-1');
  final types.User _otherUser =
      const types.User(id: 'user-2', firstName: 'Диана');

  @override
  void initState() {
    super.initState();
    _loadFakeMessages();
  }

  void _loadFakeMessages() {
    final textMessage = types.TextMessage(
      author: _otherUser,
      createdAt: DateTime.now()
          .subtract(const Duration(minutes: 5))
          .millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: 'Привет! Как дела?',
    );

    final imageMessage = types.ImageMessage(
      author: _currentUser,
      createdAt: DateTime.now()
          .subtract(const Duration(minutes: 2))
          .millisecondsSinceEpoch,
      id: const Uuid().v4(),
      name: 'Example Image',
      size: 1000,
      uri: 'https://placecats.com/bella/300/200',
    );

    setState(() {
      _messages.addAll([textMessage, imageMessage]);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatTitle),
      ),
      body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _currentUser,
          theme: DefaultChatTheme(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            inputBackgroundColor: Theme.of(context).colorScheme.surface,
            inputTextColor: Theme.of(context).colorScheme.onPrimary,
            secondaryColor: Theme.of(context).colorScheme.surface,
            sentMessageBodyTextStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
            receivedMessageBodyTextStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
            primaryColor: Colors.blue,
            inputBorderRadius: const BorderRadius.all(Radius.zero),
          )),
    );
  }
}
