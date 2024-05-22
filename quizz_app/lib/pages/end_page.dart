import 'package:flutter/material.dart';
import 'package:quizz_app/pages/home.dart';

//no necesitamos que sea flexible
class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Escribe aquí',
            border: OutlineInputBorder(),
          ),
        ),
        Expanded(child: Center(child: Text('Texto en el medio'))),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'Flutter Quizz'),
              ),
            );
          },
          child: Text('Volver a inicio'),
        ),
      ],
    ));
  }
}
