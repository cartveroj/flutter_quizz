import 'package:flutter/material.dart';
//import 'package:quizz_app/pages/quizz_page.dart';
import './pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /* title: 'Quizz game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuizzPage(),
      ), */
      // eliminar el banner de debug
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Quizz'), //el title se puede quitar
    );
  }
}
