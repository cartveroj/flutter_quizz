import 'package:flutter/material.dart';
import './pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* title: 'Quizz game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ), */
      // eliminar el banner de debug
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Quizz'), //el title se puede quitar
    );
  }
}
