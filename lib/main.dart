import 'package:fininfocom_task/View/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NumberGridApp());
}

class NumberGridApp extends StatelessWidget {
  const NumberGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Grid App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NumberGridView(),
    );
  }
}
