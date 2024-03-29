import 'package:flutter/material.dart';
import 'package:smallpox/screens/chat.dart';
import 'package:smallpox/screens/homepage.dart';
import 'package:smallpox/screens/predict.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Skin Detection",
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 1;

  final screens = [
    const Home(),
    const HomePage(),
    const ChatApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue[50],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        itemPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.camera),
            title: const Text("Predict"),
            selectedColor: Colors.blueAccent,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.blueAccent,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.chat),
            title: const Text("Chat"),
            selectedColor: Colors.blueAccent,
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
