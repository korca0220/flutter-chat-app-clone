// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart'
    show ChatRoom, Message;

class ChatApi {
  final FirebaseFirestore firestore;
  final User? user;
  ChatApi(this.firestore, this.user);

  Future<List<String>> _getChatList() async {
    try {
      final snapshot =
          await firestore.collection('users').doc(user!.email).get();
      final List<String> chats = [];
      if (snapshot.exists) {
        final chatLists = snapshot.data()![user!.email];
        for (var i in chatLists) {
          chats.add(i);
        }
      }
      return chats;
    } on FirebaseException catch (e) {
      return [];
    }
  }

  Future<Result<List<ChatRoom>, Exception>> getChatRoomList() async {
    try {
      List<ChatRoom> chatRoomsList = [];
      final chatList = await _getChatList();
      if (chatList.isNotEmpty) {
        for (var chatRoomId in chatList) {
          final snapshot =
              await firestore.collection('chatRooms').doc(chatRoomId).get();
          chatRoomsList.add(ChatRoom.fromJson(snapshot.data()!));
        }
      }
      return Success(chatRoomsList);
    } on FirebaseException catch (e) {
      return Error(e);
    }
  }

  Stream<ChatRoom> getChatRoomData(String chatRoomId) {
    try {
      final snapshot = firestore
          .collection('chatRooms')
          .doc(chatRoomId)
          .snapshots()
          .map((event) => ChatRoom.fromDocSnapshot(event));
      return snapshot;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<Result<bool, Exception>> sendMessage(
      Message message, String chatRoomId) async {
    try {
      final snapshot =
          await firestore.collection('chatRooms').doc(chatRoomId).get();
      if (snapshot.exists) {
        final roomData = ChatRoom.fromDocSnapshot(snapshot);
        var messages = [...roomData.messages, message];
        firestore.collection('chatRooms').doc(chatRoomId).update(
          {'messages': messages.map((e) => e.toJson()).toList()},
        );
      }
      return const Success(true);
    } on FirebaseException catch (e) {
      return Error(e);
    }
  }
}
