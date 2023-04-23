// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget
import 'package:flutter_chat_app_clone/domain/model/chat/chat_rooms.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.chatRoom,
    required this.user,
  });

  final ChatRoom chatRoom;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatRoom.messages.length,
      itemBuilder: (context, index) {
        final isMe = chatRoom.messages[index].sender == user!.email;
        final message = chatRoom.messages[index].content;
        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: isMe
              ? Container(
                  padding: EdgeInsets.all(10.r),
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(10.r),
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
