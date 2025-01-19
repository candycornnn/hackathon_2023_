// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hackathon/api/chat_api.dart';
import 'package:hackathon/pages/badges.dart';
import 'package:hackathon/pages/chat.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp(chatApi: ChatApi()));
}

class MyApp extends StatefulWidget {
  const MyApp({required this.chatApi, super.key});

  final ChatApi chatApi;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  var chat;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    chat = widget.chatApi;
    final List pages = [Home(), Badges(), ChatPage(chatApi: chat)];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text("PocketPal",
              style: TextStyle(fontSize: 30, color: Colors.lightGreen[100])),
          leading: Icon(Icons.monetization_on_rounded, color: Colors.black),
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
                onTabChange: _navigateBottomBar,
                backgroundColor: Colors.grey,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                padding: EdgeInsets.all(16),
                gap: 8,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                      icon: Icons.star_border_purple500_outlined,
                      text: "Badges"),
                  GButton(icon: Icons.chat, text: "Chat"),
                ]),
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber, // Your accent color
        ),
      ),
    );
  }
}
