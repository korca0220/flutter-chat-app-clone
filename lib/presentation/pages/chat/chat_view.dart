// flutter
import 'package:flutter/material.dart';

// packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// layout
import 'package:flutter_chat_app_clone/global/layout/default_layout.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart' show ChatRoom;

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart';

// view model
import 'package:flutter_chat_app_clone/presentation/pages/chat/chat_view_model.dart';

// widget
import 'package:flutter_chat_app_clone/presentation/pages/chat/widget/chat_messages.dart';
import 'package:flutter_chat_app_clone/presentation/pages/chat/widget/send_message.dart';

class ChatView extends HookWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();
    final user = context.watch<AuthNotifier>().user;
    return DefaultLayout(
      appBar: AppBar(
        elevation: 0,
        title: const Text('채팅'),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const FaIcon(
              FontAwesomeIcons.qrcode,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<ChatRoom>(
              stream: viewModel.getChatList(
                  'ONe3XyQ40bhV2JC89m9N14mzh013EudxsstYO3U9pYGod2JPptT1PuI3'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final chatRoom = snapshot.data!;
                  return ChatMessages(chatRoom: chatRoom, user: user);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          SendMessage(
            chatRoomId:
                'ONe3XyQ40bhV2JC89m9N14mzh013EudxsstYO3U9pYGod2JPptT1PuI3',
            user: user,
          ),
        ],
      ),
    );
  }
}
