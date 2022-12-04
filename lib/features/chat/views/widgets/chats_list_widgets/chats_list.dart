import 'package:flutter/material.dart';

import 'chats_list_item.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        Widget widget = const ChatsListItem();

        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: widget,
          );
        }

        return widget;
      },
    );
  }
}
