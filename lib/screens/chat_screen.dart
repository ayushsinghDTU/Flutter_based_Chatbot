import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/message_bubble.dart';
import '../services/openrouter_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<Message> messages = [];
  List<Map<String, String>> chatHistory = [];

  bool isTyping = false;

  void sendMessage() {

    String text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(Message(text: text, isUser: true));
      isTyping = true;
    });

    chatHistory.add({
      "role": "user",
      "content": text
    });

    controller.clear();

    scrollToBottom();

    aiResponse();
  }

  void aiResponse() async {

    String reply = await OpenRouterService.sendMessage(chatHistory);

    setState(() {

      messages.add(
        Message(
          text: reply,
          isUser: false,
        ),
      );

      chatHistory.add({
        "role": "assistant",
        "content": reply
      });

      isTyping = false;
    });

    scrollToBottom();
  }

  void scrollToBottom() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat")),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length + (isTyping ? 1 : 0),
              itemBuilder: (context, index) {

                if (index < messages.length) {
                  return MessageBubble(message: messages[index]);
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "AI is typing...",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        SizedBox(width: 10),
                        CircularProgressIndicator(strokeWidth: 2)
                      ],
                    ),
                  );
                }
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: const Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => sendMessage(),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: isTyping ? null : sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}