import 'package:flutter/material.dart';
import 'package:quizz_app/model/list_questions.dart';
import 'package:quizz_app/pages/home.dart';

//no necesitamos que sea flexible
class EndPage extends StatelessWidget {
  const EndPage({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 1000),
        const Text(
          'Your Score:',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: score / 3,
                color: Colors.green,
                backgroundColor: Colors.white,
              ),
            ),
            Column(
              children: [
                Text(
                  score.toString(),
                  style: const TextStyle(fontSize: 80),
                ),
                const SizedBox(height: 10),
                Text(
                  '${(score / questions.length * 100).round()}%',
                  style: const TextStyle(fontSize: 25),
                )
              ],
            )
          ],
        ),

        // const TextField(
        //   decoration: InputDecoration(
        //     labelText: 'Escribe aquí',
        //     border: OutlineInputBorder(),
        //   ),
        // ),
        //const Expanded(child: Center(child: Text('Texto en el medio'))),
        Padding(
            padding: const EdgeInsets.all(28.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Flutter Quizz'),
                  ),
                );
              },
              child: const Text('Volver a inicio'),
            )),
      ],
    ));
  }
}
