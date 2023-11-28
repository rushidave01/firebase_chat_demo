import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final String message;
  final bool rightCorner;
  const ChatBubble(
      {super.key, required this.message, required this.rightCorner});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(!widget.rightCorner ? 0 : 8),
            topRight: Radius.circular(widget.rightCorner ? 0 : 8),
            bottomLeft: const Radius.circular(8),
            bottomRight: const Radius.circular(8)),
        color: Colors.purple,
      ),
      child: Text(
        widget.message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
