import 'package:flutter/material.dart';
import 'package:mefn/utils/app_routes.dart';
import 'package:mefn/features/authentication/views/screens/login_screen.dart';
import 'package:mefn/features/authentication/views/screens/signup_screen.dart';
import 'package:mefn/features/shared/views/screens/users_search_screen.dart';
import 'package:mefn/wrapper.dart';

import '../features/chat/views/screens/chat_conversation_screen.dart';
import '../features/chat/views/screens/chats_list_screen.dart';

class AppRouter {
  static Route onGenerateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.wrapper:
        return _buildRoute(
          settings,
          const Wrapper(),
        );
      case AppRoutes.loginScreen:
        return _buildRoute(
          settings,
          const LoginScreen(),
        );
      case AppRoutes.signUpScreen:
        return _buildRoute(
          settings,
          const SignUpScreen(),
        );
      case AppRoutes.chatsListScreen:
        return _buildRoute(
          settings,
          const ChatsListScreen(),
        );
      case AppRoutes.chatConvoScreen:
        return _buildRoute(
          settings,
          const ChatConversationScreen(),
        );
      case AppRoutes.usersSearchScreen:
        return _buildRoute(
          settings,
          const UsersSearchScreen(),
        );
      default:
        return _buildRoute(
          settings,
          const Wrapper(),
        );
    }
  }

  static Route _buildRoute(
    final RouteSettings settings,
    final Widget widget,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
