import 'package:flutter/material.dart';
import 'package:mefn/features/shared/views/widgets/app_text.dart';

import '../widgets/chat_conversation_widgets/chat_message_input.dart';

class ChatConversationScreen extends StatelessWidget {
  const ChatConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: const AppText.title(
            'Ram Bahadur',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          iconSize: 20.0,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const ChatMessageInput(),
      ),
    );
  }
}
