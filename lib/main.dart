import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add_card_page.dart';
import 'card_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/addCard': (context) => const AddCardPage(),
        '/cardDetail': (context) => const CardDetailPage(),
      },
    );
  }
}
