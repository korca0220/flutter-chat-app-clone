// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart' show Message;

// view model
import 'package:flutter_chat_app_clone/presentation/pages/chat/chat_view_model.dart';

class SendMessage extends HookWidget {
  final String chatRoomId;
  final User? user;
  const SendMessage({
    required this.chatRoomId,
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final messageController = useTextEditingController();
    final viewModel = context.watch<ChatViewModel>();
    return Row(
      children: [
        Icon(
          Icons.add,
          color: Colors.grey.shade500,
          size: 30.r,
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: TextField(
              controller: messageController,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: '메세지 보내기',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: const BorderSide(
                    color: Colors.black26,
                    width: 0.2,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            final message = Message(
              content: messageController.text,
              sender: user!.email!,
              createdAt: DateTime.now().toString(),
            );
            viewModel.sendMessage(chatRoomId, message);
            messageController.clear();
          },
          child: FaIcon(
            FontAwesomeIcons.paperPlane,
            color: Colors.grey.shade600,
          ),
        )
      ],
    );
  }
}
