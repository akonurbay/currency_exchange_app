import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Импортируйте ваш HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currenввуcy Exchange',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomeScreen(), // Указываем HomeScreen как главный экран
    );
  }
}