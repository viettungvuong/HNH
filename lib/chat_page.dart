import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:bubble/bubble.dart';
import 'package:hnh/login.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid

Widget _bubbleBuilder(
  Widget child, {
  required message,
  required nextMessageInGroup,
}) {
  return Bubble(
    child: child,
    color: currentUsr!.uid != message.author.id ||
            message.type == types.MessageType.image
        ? const Color(0xfff5f5f7)
        : const Color(
            0xff6f61e8), //tuc la kiem tra xem user co phai la nguoi viet tin nhan hay kh, tu do ap dung mau
    margin:
        nextMessageInGroup ? const BubbleEdges.symmetric(horizontal: 6) : null,
    nip: nextMessageInGroup
        ? BubbleNip.no
        : currentUsr!.uid != message.author.id
            ? BubbleNip.leftBottom
            : BubbleNip.rightBottom,
  );
}

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<chatPage> {
  List<types.Message> _messages = [];
  final _user = types.User(id: currentUsr!.uid);

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }
}
