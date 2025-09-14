import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            const CircleAvatar(
              child: Icon(Icons.agriculture),
            ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(text),
            ),
          ),
          if (isUser)
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
        ],
      ),
    );
  }
}
