import 'package:flutter/material.dart';
import 'package:mefn/features/chat/views/widgets/chats_list_widgets/chats_list.dart';
import 'package:mefn/features/shared/views/widgets/app_input.dart';
import 'package:mefn/utils/app_colors.dart';
import 'package:mefn/utils/app_routes.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SafeArea(
          child: _searchBuilder(context),
        ),
      ),
      body: const ChatsList(),
    );
  }

  Widget _searchBuilder(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
            child: AppInput(
              hintText: 'Search...',
              height: 40.0,
              enabled: false,
              leading: const Icon(
                Icons.search_rounded,
                color: kcLightGrey,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.usersSearchScreen,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
