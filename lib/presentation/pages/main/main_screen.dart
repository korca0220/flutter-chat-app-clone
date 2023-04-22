import 'package:flutter/material.dart';
import 'package:flutter_chat_app_clone/presentation/pages/chat/chat_view.dart';
import 'package:flutter_chat_app_clone/presentation/pages/home/home_view.dart';

import 'package:flutter_chat_app_clone/presentation/pages/profile/profile_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
      body: SafeArea(child: _buildView()[selectedIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        currentIndex: selectedIndex.value,
        onTap: (index) {
          selectedIndex.value = index;
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  List<Widget> _buildView() {
    return const <Widget>[
      HomeView(),
      ChatView(),
      ProfileView(),
    ];
  }
}
