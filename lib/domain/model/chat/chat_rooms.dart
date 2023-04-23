import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app_clone/domain/model/chat/member.dart';
import 'package:flutter_chat_app_clone/domain/model/chat/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_rooms.freezed.dart';
part 'chat_rooms.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  factory ChatRoom({
    required String chatRoomId,
    required Member writer,
    required Member contactor,
    required List<Message> messages,
  }) = _ChatRoom;

  // factory ChatRoom.fromJson(Map<String, dynamic> json) {
  //   return ChatRoom(
  //     chatRoomId: json['chatRoomId'],
  //     writer: Member.fromJson(json['writer']),
  //     contactor: Member.fromJson(json['contactor']),
  //     messages:
  //         json['messages'].map((message) => Message.fromJson(message)).toList(),
  //   );
  // }
  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  factory ChatRoom.fromDocSnapshot(DocumentSnapshot snapshot) {
    final List<Message> message = [];
    final messageSnapshot =
        List<Map<String, dynamic>>.from(snapshot['messages'] as List);
    for (var i in messageSnapshot) {
      message.add(Message.fromJson(i));
    }
    return ChatRoom(
      chatRoomId: snapshot['chatRoomId'],
      writer: Member.fromJson(snapshot['writer']),
      contactor: Member.fromJson(snapshot['contactor']),
      messages: message,
    );
  }
}
